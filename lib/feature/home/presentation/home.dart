import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/colors/colors.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/feature/home/presentation/widgets/drawer_item.dart';
import 'package:original_vip/feature/home/presentation/widgets/my_appbar.dart';
import 'package:original_vip/feature/home/presentation/widgets/my_drawer.dart';
import 'package:original_vip/feature/home/presentation/widgets/top_tab_bar.dart';

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
                        child: const TabBarView(children: [
                          Center(child: Text("كل الابتوبات")),
                          Center(child: Text("فى مصر")),
                          Center(child: Text("فى الإمارات")),
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
            child:  FloatingActionButton(onPressed: () {},
              backgroundColor: AppColors.whiteColor,
              child: const Icon(Icons.shopping_cart,color: AppColors.mainColor,),
            ),
          ),
        ],
      ),
    );
  }
}
