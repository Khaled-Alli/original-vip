import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/di/sl.dart';
import 'package:original_vip/core/helpers/colors/colors.dart';
import 'package:original_vip/core/routing/routing.dart';
import 'package:original_vip/feature/cart/model/cart_item_model.dart';
import 'package:original_vip/feature/home/presentation/widgets/laptop_item.dart';
import 'package:original_vip/feature/home/presentation/widgets/my_appbar.dart';
import 'package:original_vip/feature/home/presentation/widgets/my_drawer.dart';
import 'package:original_vip/feature/home/presentation/widgets/top_tab_bar.dart';
import 'package:original_vip/feature/home/view_model/home_cubit.dart';

import '../../../core/helpers/extentions/extentions.dart';
import '../../../core/helpers/themes/themes.dart';
import '../../../demo-data.dart';
import '../../cart/view_model/cart_cubit.dart';
import '../../cart/view_model/cart_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        backgroundColor: AppColors.lightBackgroundColor,
        title: const MyAppBar(),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                HapticFeedback.lightImpact();
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
        toolbarHeight: 60.h,
      ),
      endDrawer: const Drawer(
        backgroundColor: AppColors.lightBackgroundColor,
        child: MyDrawer(),
      ),
      body: Stack(
        children: [
          SafeArea(
          child: Center(
            child: Column(
              children: [
                DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      const TopTabBar(),
                      SizedBox(
                        height: 540.h,
                        child: TabBarView(children: [
                          ListView.separated(
                            itemBuilder: (context, index) => GestureDetector(
                              child: LaptopItem(laptop: demo_laptops[index],),
                              onTap: () {
                                HapticFeedback.lightImpact();
                                context.pushNamed(Routes.laptopDetailsScreen,
                                    arguments: demo_laptops[index]);
                              },
                            ),
                            separatorBuilder: (context, index) => verticalSpace(10),
                            itemCount: demo_laptops.length,
                          ),
                          ListView.separated(
                            itemBuilder: (context, index) => GestureDetector(
                              child: LaptopItem(laptop: demo_laptops.where((item) => !item.inAED).toList()[index]),
                              onTap: () {
                                HapticFeedback.lightImpact();
                                context.pushNamed(Routes.laptopDetailsScreen,
                                    arguments: demo_laptops[index]);
                              },
                            ),
                            separatorBuilder: (context, index) => verticalSpace(10),
                            itemCount: demo_laptops.where((item) => !item.inAED).toList().length,
                          ),
                          ListView.separated(
                            itemBuilder: (context, index) => GestureDetector(
                              child: LaptopItem(laptop: demo_laptops.where((item) => item.inAED).toList()[index]),
                              onTap: () {
                                HapticFeedback.lightImpact();
                                context.pushNamed(Routes.laptopDetailsScreen,
                                    arguments: demo_laptops[index]);
                              },
                            ),
                            separatorBuilder: (context, index) => verticalSpace(10),
                            itemCount: demo_laptops.where((item) => item.inAED).toList().length,
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
          BlocBuilder<CartCubit,List<CartItem>>(
            builder:(context,state)=> Positioned(
              bottom: 50.h, // Adjust position
              right: 10.w, // Adjust position
              child: Stack(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      context.pushNamed(Routes.CartScreen);
                    },
                    backgroundColor: AppColors.whiteColor,
                    child: const Icon(
                      Icons.shopping_cart,
                      color: AppColors.mainColor,
                    ),
                  ),
                  if (context.read<CartCubit>().cartItems.isNotEmpty)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IgnorePointer(
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.darktGrayColor,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 30,
                            minHeight: 30,
                          ),
                          child: BlocBuilder<CartCubit, List<CartItem>>(
                            builder: (context, state) => Text(
                              context.read<CartCubit>().cartItems.length.toString(),
                              // Updated to use cartItems.length
                              style: TextStyles.font14whiteBold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
