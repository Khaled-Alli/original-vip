import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:original_vip/core/di/sl.dart';
import 'package:original_vip/core/helpers/colors/colors.dart';
import 'package:original_vip/core/networking/push_notification_service.dart';
import 'package:original_vip/core/routing/routing.dart';
import 'package:original_vip/feature/authentication/view_model/auth_cubit.dart';
import 'package:original_vip/feature/cart/model/cart_item_model.dart';
import 'package:original_vip/feature/home/presentation/widgets/laptop_item.dart';
import 'package:original_vip/feature/home/presentation/widgets/my_appbar.dart';
import 'package:original_vip/feature/home/presentation/widgets/my_drawer.dart';
import 'package:original_vip/feature/home/presentation/widgets/top_tab_bar.dart';
import 'package:original_vip/feature/home/view_model/additional_cubit.dart';
import 'package:original_vip/feature/home/view_model/additional_state.dart';
import 'package:original_vip/feature/home/view_model/laptop_cubit.dart';

import '../../../core/helpers/constants/constants.dart';
import '../../../core/helpers/extentions/extentions.dart';
import '../../../core/helpers/themes/themes.dart';
import '../../cart/view_model/cart_cubit.dart';
import '../../cart/view_model/cart_state.dart';
import '../../cart/view_model/order_cubit.dart';
import '../../cart/view_model/order_state.dart';
import '../../user_profile/view_model/payment_cubit.dart';
import '../../user_profile/view_model/payment_state.dart';
import '../view_model/laptop_state.dart';

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
        title:  const MyAppBar(AppConstants.APP_NAME),
        actions: [
          Builder(
            builder: (context) =>
                IconButton(
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
      body: LiquidPullToRefresh(
        color: AppColors.lightBackgroundColor,
        backgroundColor: AppColors.mainColor,
        height: 100.h,
        animSpeedFactor: 2,
        onRefresh: () async{
          await context.read<LaptopCubit>().getLaptops();
          await context.read<AdditionalCubit>().getAdditionals();
          await context.read<PaymentCubit>().getPayments(context.read<AuthCubit>().user!.id);
          await context.read<OrderCubit>().getOrders(context.read<AuthCubit>().user!.id);
        },
        child: Stack(
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
                            BlocBuilder<LaptopCubit, LaptopState>(
                              builder: (context, laptopState) {
                                if (laptopState is LaptopLoadedState) {
                                  return SizedBox(
                                    height: 540.h,
                                    child: TabBarView(children: [
                                      ListView.separated(
                                        itemBuilder: (context, index) =>
                                            GestureDetector(
                                              child: LaptopItem(
                                                laptop: laptopState.laptops[index],
                                              ),
                                              onTap: () {
                                                HapticFeedback.lightImpact();
                                                context.pushNamed(
                                                    Routes.laptopDetailsScreen,
                                                    arguments: laptopState
                                                        .laptops[index]);
                                              },
                                            ),
                                        separatorBuilder: (context, index) =>
                                            verticalSpace(10),
                                        itemCount: laptopState.laptops.length,
                                      ),
                                      ListView.separated(
                                        itemBuilder: (context, index) =>
                                            GestureDetector(
                                              child: LaptopItem(
                                                  laptop: laptopState.laptops
                                                      .where((item) =>
                                                  !item.inAED)
                                                      .toList()[index]),
                                              onTap: () {
                                                HapticFeedback.lightImpact();
                                                context.pushNamed(
                                                    Routes.laptopDetailsScreen,
                                                    arguments: laptopState
                                                        .laptops[index]);
                                              },
                                            ),
                                        separatorBuilder: (context, index) =>
                                            verticalSpace(10),
                                        itemCount: laptopState.laptops
                                            .where((item) => !item.inAED)
                                            .toList()
                                            .length,
                                      ),
                                      ListView.separated(
                                        itemBuilder: (context, index) =>
                                            GestureDetector(
                                              child: LaptopItem(
                                                  laptop: laptopState.laptops
                                                      .where((item) => item.inAED)
                                                      .toList()[index]),
                                              onTap: () {
                                                HapticFeedback.lightImpact();
                                                context.pushNamed(
                                                    Routes.laptopDetailsScreen,
                                                    arguments: laptopState
                                                        .laptops[index]);
                                              },
                                            ),
                                        separatorBuilder: (context, index) =>
                                            verticalSpace(10),
                                        itemCount: laptopState.laptops
                                            .where((item) => item.inAED)
                                            .toList()
                                            .length,
                                      ),
                                    ]),
                                  );
                                } else if (laptopState is LaptopErrorState) {
                                  return Center(
                                    child: Text(
                                      laptopState.errorMessage,
                                      style: TextStyles.font15mainColorBold,
                                    ),
                                  );
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.mainColor,
                                      ));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            BlocBuilder<CartCubit, List<CartItem>>(
              builder: (context, cartState) =>
                  Positioned(
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
                        if (context
                            .read<CartCubit>()
                            .cartItems
                            .isNotEmpty)
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
                                  builder: (context, cartState) =>
                                      Text(
                                        context
                                            .read<CartCubit>()
                                            .cartItems
                                            .length
                                            .toString(),
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
            BlocBuilder<PaymentCubit, PaymentState>(builder: (context, paymentState)=> Container(),),
            BlocBuilder<OrderCubit, OrderState>(builder: (context, orderState)=> Container(),),
          ],
        ),
      ),
    );
  }
}
