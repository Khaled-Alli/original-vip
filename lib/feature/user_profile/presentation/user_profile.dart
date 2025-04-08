import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/extentions/extentions.dart';
import 'package:original_vip/feature/cart/view_model/order_cubit.dart';
import 'package:original_vip/feature/user_profile/presentation/widgets/orders_section.dart';
import 'package:original_vip/feature/user_profile/presentation/widgets/profile_section.dart';
import '../../../core/helpers/colors/colors.dart';
import '../../../core/helpers/constants/constants.dart';
import '../../../core/helpers/themes/themes.dart';
import '../../cart/model/order_model.dart';
import '../../cart/view_model/order_state.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: AppColors.lightBackgroundColor,
        title: Text(
          AppConstants.profileText,
          style: TextStyles.font18whiteBold,
        ),
        centerTitle: true,
        toolbarHeight: 60.h,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: 360.w,
              // height: 600.h,
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileSection(),
                  verticalSpace(20),
                  BlocBuilder<OrderCubit, OrderState>(
                    builder: (context, orderState) {
                      if (orderState is OrderLoadedState) {
                        return Column(
                          children: [
                            OrdersSection(
                                AppConstants.pendingOrdersTXT,
                                orderState.orders
                                    .where((i) =>
                                        i.orderStatus ==
                                        AppConstants.orderStatus_Pending)
                                    .toList()),
                            verticalSpace(30),
                            OrdersSection(
                                AppConstants.inProgressOrdersTXT,
                                orderState.orders
                                    .where((i) =>
                                        i.orderStatus ==
                                        AppConstants.orderStatus_InProgress)
                                    .toList()),
                            verticalSpace(30),
                            OrdersSection(
                                AppConstants.deliveredOrdersTXT,
                                orderState.orders
                                    .where((i) =>
                                        i.orderStatus ==
                                        AppConstants.orderStatus_Delivered)
                                    .toList()),
                            verticalSpace(30),
                          ],
                        );
                      } else if (orderState is OrderErrorState) {
                        return Center(
                          child: Text(
                            orderState.errorMessage,
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
          ),
        ),
      ),
    );
  }
}
