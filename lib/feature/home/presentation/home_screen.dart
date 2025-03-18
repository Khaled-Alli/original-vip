import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/colors/colors.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/core/routing/routing.dart';
import 'package:original_vip/feature/home/model/laptop_model.dart';
import 'package:original_vip/feature/home/presentation/widgets/drawer_item.dart';
import 'package:original_vip/feature/home/presentation/widgets/laptop_item.dart';
import 'package:original_vip/feature/home/presentation/widgets/my_appbar.dart';
import 'package:original_vip/feature/home/presentation/widgets/my_drawer.dart';
import 'package:original_vip/feature/home/presentation/widgets/top_tab_bar.dart';

import '../../../core/helpers/extentions/extentions.dart';
import '../../../demo-data.dart';

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
                            itemBuilder: (context, index) =>
                                GestureDetector(child: LaptopItem(laptop: demo_laptops[index],),
                                onTap: (){
                                  context.pushNamed(Routes.laptopDetailsScreen,arguments: demo_laptops[index]);
                                },),
                            separatorBuilder: (context, index) => verticalSpace(10),
                            itemCount: demo_laptops.length,
                          ),
                          ListView.separated(
                            itemBuilder: (context, index) =>
                                LaptopItem(laptop: demo_laptops.where((item)=>!item.inAED).toList()[index],),
                            separatorBuilder: (context, index) => verticalSpace(10),
                            itemCount:  demo_laptops.where((item)=>!item.inAED).toList().length,
                          ),
                          ListView.separated(
                            itemBuilder: (context, index) =>
                                LaptopItem(laptop: demo_laptops.where((item)=>item.inAED).toList()[index],),
                            separatorBuilder: (context, index) => verticalSpace(10),
                            itemCount: demo_laptops.where((item)=>item.inAED).toList().length,
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
          Positioned(
            bottom: 50.h, // Adjust position
            right: 10.w, // Adjust position
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColors.whiteColor,
              child: const Icon(
                Icons.shopping_cart,
                color: AppColors.mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
