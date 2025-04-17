import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:original_vip/feature/authentication/view_model/auth_cubit.dart';
import 'package:original_vip/feature/cart/model/cart_item_model.dart';
import 'package:original_vip/feature/cart/presentation/widgets/cart_Item.dart';
import 'package:original_vip/feature/cart/presentation/widgets/cart_items_section.dart';
import 'package:original_vip/feature/cart/presentation/widgets/cost_and_commission_section.dart';
import 'package:original_vip/feature/cart/presentation/widgets/empty_cart.dart';
import 'package:original_vip/feature/cart/presentation/widgets/end_user_info_section.dart';
import 'package:original_vip/feature/cart/presentation/widgets/notes_section.dart';
import 'package:original_vip/feature/cart/view_model/cart_cubit.dart';
import 'package:original_vip/feature/cart/view_model/order_cubit.dart';
import '../../../core/networking/push_notification_service.dart';
import '../../user_profile/view_model/payment_cubit.dart';
import '../model/order_model.dart' as MyOrders;
import '../../../core/helpers/colors/colors.dart';
import '../../../core/helpers/constants/constants.dart';
import '../../../core/helpers/extentions/extentions.dart';
import '../../../core/helpers/themes/themes.dart';
import '../../../core/routing/routing.dart';
import '../../authentication/presentation/widgets/app_Button.dart';
import '../../home/presentation/widgets/my_appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
        title: Text(AppConstants.CartText, style: TextStyles.font25WhiteColorBold,),
        centerTitle: true,
        toolbarHeight: 60.h,
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child:BlocBuilder<CartCubit,List<CartItem>>(builder: (context,state)=> Container(
                height:context.read<CartCubit>().cartItems.isEmpty ?500.h : 775.h,
                width: 360.w,
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child:
                    context.read<CartCubit>().cartItems.isEmpty ? const EmptyCart() :
                    Form(
                      key: context.read<CartCubit>().formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CartItemsSection(),
                          verticalSpace(10.h),
                          const CostAndCommissionSection(),
                          verticalSpace(10.h),
                          const  EndUserInfoSection(),
                          verticalSpace(10.h),
                          const  NotesSection(),
                          verticalSpace(20.h),
                          AppTextButton(
                            buttonText: AppConstants.makeOrder,
                            textStyle: TextStyles.font14whiteBold,
                            onPressed: () async{
                              HapticFeedback.lightImpact();
                              final cartCubit = context.read<CartCubit>();
                              final orderCubit = context.read<OrderCubit>();
                              final authCubit = context.read<AuthCubit>();
                              final paymentCubit = context.read<PaymentCubit>();

                              if (cartCubit.formKey.currentState!.validate()) {
                                final order = MyOrders.Order(
                                  generateUuid(),
                                  authCubit.user!.id,
                                  cartCubit.totalCartItemEndUserPrice() - cartCubit.totalCartItemDealerPrice(),
                                  cartCubit.endUserOrderNotesController.text,
                                  cartCubit.endUserNameController.text,
                                  cartCubit.endUserPhoneController.text,
                                  cartCubit.endUserAddressController.text,
                                  cartCubit.totalCartItemDealerPrice(),
                                  cartCubit.state,
                                  AppConstants.orderStatus_Pending,
                                  cartCubit.totalCartItemEndUserPrice(),
                                  DateTime.now().toFormattedString(),
                                );
                                await orderCubit.createOrders(order);
                                Fluttertoast.showToast(
                                  msg: AppConstants.orderCreatedSuccessfullyText,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: AppColors.whiteColor,
                                  textColor: AppColors.mainColor,
                                  fontSize: 16.0,
                                );
                                await PushNotificationService.sendNotificationToAdmins();
                                await cartCubit.afterCreateOrder();
                                context.pushNamedAndRemoveUntil(Routes.homeScreen);
                                await orderCubit.getOrders(authCubit.user!.id);
                                await paymentCubit.getPayments(authCubit.user!.id);
                              }
                            },
                          ),
                        ],
                      ),
                    ),),




            ),
          ),
        ),
      ),
    );
  }
// Future<void> validateOrderInfo(BuildContext context) async {
//   if (context.read<CartCubit>().formKey.currentState!.validate()) {
//     // await context.read<AuthCubit>().login();
//     print(context.read<CartCubit>().endUserPhoneController.text);
//     print("context.read<CartCubit>().endUserNameController.text");
//   }
// }
}
