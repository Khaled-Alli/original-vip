// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:original_vip/feature/cart/model/order_model.dart';
//
// import '../../../../core/helpers/colors/colors.dart';
// import '../../../../core/helpers/constants/constants.dart';
// import '../../../../core/helpers/extentions/extentions.dart';
// import '../../../../core/helpers/themes/themes.dart';
//
// class OrderItem extends StatelessWidget {
//   Order order;
//    OrderItem(this.order);
//
//   @override
//   Widget build(BuildContext context) {
//     return  ClipRRect(
//       borderRadius: BorderRadius.circular(16,),
//       child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(16,),
//         border: Border.all(color: AppColors.darktGrayColor,),
//       ),
//         padding:  const EdgeInsets.all(2),
//         child:    ExpansionTile(
//           backgroundColor: AppColors.lightBackgroundColor,
//           title: SizedBox(
//             height: 35.h,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text("العميل : ", style: TextStyles.font12whiteBold),
//                 SizedBox(
//                     width: 120.w,
//                     child: Text(order.endUserName, style: TextStyles.font12whiteBold)),
//                 const Spacer(),
//                 Text("العمولة : ", style: TextStyles.font12whiteBold),
//                 Text(order.commission.toString(), style: TextStyles.font12whiteBold),
//               ],),
//           ),
//           subtitle: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text("السعر للديلر : ", style: TextStyles.font12whiteBold),
//               Text(order.totalOrderDealerPrice.toString(), style: TextStyles.font12whiteBold),
//               Spacer(),
//               Text("السعر لليوزر : ", style: TextStyles.font12whiteBold),
//               Text(order.totalOrderEndUserPrice.toString(), style: TextStyles.font12whiteBold),
//             ],),
//           shape: const Border(),
//           collapsedShape: const Border(),
//           children: [
//
//
//             Container(
//               ///Todo:::::
//               height: 195.h,
//               // margin: EdgeInsets.symmetric(horizontal: 5.w),
//               decoration: BoxDecoration(
//                 color: AppColors.lightBackgroundColor,
//                 borderRadius: BorderRadius.circular(16),
//
//               ),
//               child: Directionality(
//                 textDirection: TextDirection.ltr,
//                 child: Column(
//                   children: [
//                    ListView.builder(itemBuilder: (context,index)=> Container(
//                      margin: EdgeInsets.symmetric(vertical: 5.h),
//                      padding: EdgeInsets.all(5.w),
//                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16,),
//                        border: Border.all(color: AppColors.darktGrayColor,),
//                      ),
//                      child: Column(
//                        children: [
//                          Container(
//                            height: 85.h,
//                            padding: EdgeInsets.all(10.w),
//                            child: Row(children: [
//                              SizedBox(
//                                width: 160.w,
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                  children: [
//                                    Text(order.cartItems[index].laptop.name,style: TextStyles.font13whiteBold ,maxLines: 1,overflow: TextOverflow.ellipsis,),
//                                    Text(order.cartItems[index].laptop.viga,style: TextStyles.font13whiteBold,maxLines: 1,overflow: TextOverflow.ellipsis,),
//                                    Row(
//                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                      children: [
//                                        SizedBox(
//                                            width: 45.w,
//                                            child: Text(order.cartItems[index].laptop.ram,style: TextStyles.font13whiteBold,maxLines: 1,overflow: TextOverflow.ellipsis,)),
//                                        SizedBox(
//                                            width: 50.w,
//                                            child: Text(order.cartItems[index].laptop.hard,style: TextStyles.font13whiteBold,maxLines: 1,overflow: TextOverflow.ellipsis,)),
//                                      ],),
//                                  ],),
//                              ),
//                              SizedBox(
//                                width: 70.w,
//                                child:   Column(
//                                  children: [
//                                    Text(order.cartItems[index].laptop.processor,style: TextStyles.font13whiteBold,maxLines: 1,overflow: TextOverflow.ellipsis,),
//                                    verticalSpace(4),
//                                    Text("${order.cartItems[index].laptop.price} L.E",style: TextStyles.font13mainColorBold,maxLines: 1,overflow: TextOverflow.ellipsis,),
//                                    Text("X",style: TextStyles.font10mainColorBold,maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
//                                    Text("${order.cartItems[index].amount}",style: TextStyles.font13mainColorBold,maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
//                                  ],
//                                ),
//                              ),
//                            ],),
//                          ),
//                          Container(
//                            padding: EdgeInsets.symmetric(vertical: 3.h),
//                            width: 234.w,
//                            child: const Divider(color: AppColors.lightGrayColor,height: 0,),
//                          ),
//                          SizedBox(
//                              height: 40.h,
//                              width: 210.w,
//                              child: Row(
//                                children: [
//                                  Expanded(
//                                    child: Padding(
//                                      padding:  EdgeInsets.only(right: 10.w),
//                                      child: Text(
//                                        order.cartItems[index].additionals.isEmpty
//                                            ? AppConstants.noAdditionalsText
//                                            : order.cartItems[index].additionals.map((i) => "${i.name} X ${i.amount}").join(", ")
//                                        ,
//                                        style: TextStyles.font13whiteBold,
//                                        maxLines: 2,
//                                        overflow: TextOverflow.ellipsis,
//                                      ),
//                                    ),
//                                  ),
//                                  SizedBox(height: 30.h,
//                                      width: 50.w,
//                                      child: Center(child: Text( AppConstants.additionalsTXT,style: TextStyles.font13whiteBold,maxLines: 1,overflow: TextOverflow.ellipsis,))),
//
//                                ],
//                              )),
//                        ],
//                      ),
//                    ),
//                    itemCount: order.cartItems.length,
//                    ),
//
//
//                     Container(
//                       padding: EdgeInsets.symmetric(vertical: 3.h),
//                       width: 234.w,
//                       child: const Divider(color: AppColors.lightGrayColor,height: 0,),
//                     ),
//                     SizedBox(
//                         width: 234.w,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               children: [
//                                 SizedBox(
//                                   // height: 37.h,
//                                     width:90.w,
//                                     child: Center(child: Text("رقم العميل",style: TextStyles.font13whiteBold ,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,))),
//                                 SizedBox(
//                                     width:90.w,
//                                     child: Text(order.endUserPhone
//                                       // (cartItem.totalCartItemEndUserPrice - cartItem.totalCartItemDealerPrice).toString()
//                                       ,style: TextStyles.font13mainColorBold ,maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)),
//                               ],),
//                             Column(
//                               children: [
//                                 SizedBox(
//                                     width:120.w,
//                                     child: Text("عنوان العميل",style: TextStyles.font13whiteBold ,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)),
//                                 SizedBox(
//                                     width:120.w,
//                                     child: Text(order.endUserAddress,style: TextStyles.font13mainColorBold ,maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)),
//                               ],),
//                           ],
//                         )),
//                   ],
//                 ),
//               ),
//             ),
//
//
//           ],
//
//         ), ),
//     );
//   }
// }
//
//
//
//

















// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:original_vip/feature/cart/model/order_model.dart';
// import '../../../../core/helpers/colors/colors.dart';
// import '../../../../core/helpers/constants/constants.dart';
// import '../../../../core/helpers/extentions/extentions.dart';
// import '../../../../core/helpers/themes/themes.dart';
//
// class OrderItem extends StatelessWidget {
//   final Order order;
//
//   OrderItem(this.order, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(16),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: AppColors.darktGrayColor),
//         ),
//         padding: const EdgeInsets.all(2),
//         child: ExpansionTile(
//           backgroundColor: AppColors.lightBackgroundColor,
//           collapsedShape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//             side: BorderSide(color: AppColors.darktGrayColor),
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//             side: BorderSide(color: AppColors.darktGrayColor),
//           ),
//           tilePadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//           childrenPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
//
//           title: Row(
//             children: [
//               Text("العميل : ", style: TextStyles.font12whiteBold),
//               Expanded(child: Text(order.endUserName, style: TextStyles.font12whiteBold, maxLines: 1, overflow: TextOverflow.ellipsis)),
//               Text(" | العمولة : ", style: TextStyles.font12whiteBold),
//               Text("${order.commission} L.E", style: TextStyles.font12whiteBold),
//             ],
//           ),
//
//           subtitle: Row(
//             children: [
//               Text("السعر للديلر : ", style: TextStyles.font12whiteBold),
//               Text("${order.totalOrderDealerPrice} L.E", style: TextStyles.font12whiteBold),
//               Spacer(),
//               Text("السعر للمستخدم : ", style: TextStyles.font12whiteBold),
//               Text("${order.totalOrderEndUserPrice} L.E", style: TextStyles.font12whiteBold),
//             ],
//           ),
//
//           children: [
//             /// 📌 **عرض عناصر الطلب**
//             SizedBox(
//               height: order.cartItems.length * 120.h, // تعيين ارتفاع مناسب حسب عدد العناصر
//               child: ListView.builder(
//                 shrinkWrap: true, // حل المشكلة الأساسية
//                 physics: NeverScrollableScrollPhysics(), // يمنع التمرير داخل `ListView`
//                 itemCount: order.cartItems.length,
//                 itemBuilder: (context, index) {
//                   var cartItem = order.cartItems[index];
//                   return Container(
//                     margin: EdgeInsets.symmetric(vertical: 5.h),
//                     padding: EdgeInsets.all(8.w),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       border: Border.all(color: AppColors.darktGrayColor),
//                       color: AppColors.lightBackgroundColor,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         /// 🔹 **معلومات اللابتوب**
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(cartItem.laptop.name, style: TextStyles.font13whiteBold, maxLines: 1, overflow: TextOverflow.ellipsis),
//                                   Text(cartItem.laptop.viga, style: TextStyles.font13whiteBold, maxLines: 1, overflow: TextOverflow.ellipsis),
//                                 ],
//                               ),
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(cartItem.laptop.processor, style: TextStyles.font13whiteBold, maxLines: 1, overflow: TextOverflow.ellipsis),
//                                 verticalSpace(4),
//                                 Text("${cartItem.laptop.price} L.E", style: TextStyles.font13mainColorBold, maxLines: 1, overflow: TextOverflow.ellipsis),
//                                 Text("X ${cartItem.amount}", style: TextStyles.font13mainColorBold, maxLines: 1, overflow: TextOverflow.ellipsis),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Divider(color: AppColors.lightGrayColor),
//
//                         /// 🔹 **الإضافات المختارة**
//                         if (cartItem.additionals.isNotEmpty) ...[
//                           Padding(
//                             padding: EdgeInsets.only(top: 5.h),
//                             child: Text(
//                               "الإضافات: ${cartItem.additionals.map((i) => "${i.name} X ${i.amount}").join(", ")}",
//                               style: TextStyles.font13whiteBold,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           Divider(color: AppColors.lightGrayColor),
//                         ],
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//
//             /// 🔹 **معلومات العميل**
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildClientInfo("📞 رقم العميل", order.endUserPhone),
//                   _buildClientInfo("🏠 عنوان العميل", order.endUserAddress),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// 🔹 **ودجت مخصصة لمعلومات العميل**
//   Widget _buildClientInfo(String title, String value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(title, style: TextStyles.font13whiteBold, textAlign: TextAlign.center),
//         SizedBox(height: 5.h),
//         Container(
//           width: 120.w,
//           padding: EdgeInsets.symmetric(vertical: 5.h),
//           decoration: BoxDecoration(
//             color: AppColors.lightBackgroundColor,
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: AppColors.darktGrayColor),
//           ),
//           child: Center(
//             child: Text(value, style: TextStyles.font13mainColorBold, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/feature/cart/model/order_model.dart';
import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/helpers/constants/constants.dart';
import '../../../../core/helpers/extentions/extentions.dart';
import '../../../../core/helpers/themes/themes.dart';
import '../../../authentication/view_model/auth_cubit.dart';
import 'end_user_address.dart';
import 'end_user_phone.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.darktGrayColor),
        ),
        padding: const EdgeInsets.all(2),
        child: ExpansionTile(
          backgroundColor: AppColors.lightBackgroundColor,
          title: SizedBox(
            height: 35.h,
            child: Row(
              children: [
                Text(AppConstants.endUserTXT, style: TextStyles.font12whiteBold),
                SizedBox(
                    width: 120.w,
                    child: Text(order.endUserName, style: TextStyles.font12whiteBold)),
                const Spacer(),
                Text(AppConstants.commission_TXT, style: TextStyles.font12whiteBold),
                Text(order.commission.toString(), style: TextStyles.font12whiteBold),
              ],
            ),
          ),
          subtitle: Row(
            children: [
              Text(AppConstants.dealerPriceTXT, style: TextStyles.font12whiteBold),
              Text(order.totalOrderDealerPrice.toString(), style: TextStyles.font12whiteBold),
              const Spacer(),
              Text(AppConstants.endUserPriceTXT, style: TextStyles.font12whiteBold),
              Text(order.totalOrderEndUserPrice.toString(), style: TextStyles.font12whiteBold),
            ],
          ),
          shape: const Border(),
          collapsedShape: const Border(),
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.cartItems!.length,
              itemBuilder: (context, index) {
                return Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.darktGrayColor),
                      color: AppColors.blackColor,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 85.h,
                          padding: EdgeInsets.all(10.w),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 160.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(order.cartItems![index].laptop![0].name,
                                        style: TextStyles.font13whiteBold,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                    Text(order.cartItems![index].laptop![0].viga,
                                        style: TextStyles.font13whiteBold,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: 45.w,
                                            child: Text(order.cartItems![index].laptop![0].ram,
                                                style: TextStyles.font13whiteBold,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis)),
                                        SizedBox(
                                            width: 50.w,
                                            child: Text(order.cartItems![index].laptop![0].hard,
                                                style: TextStyles.font13whiteBold,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 70.w,
                                child: Column(
                                  children: [
                                    Text(order.cartItems![index].laptop![0].processor,
                                        style: TextStyles.font13whiteBold,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                    verticalSpace(4),
                                    Text("${context.read<AuthCubit>().user!.role == "trader"? order.cartItems![index].laptop![0].traderPrice:order.cartItems![index].laptop![0].dealerPrice} L.E",
                                        style: TextStyles.font13mainColorBold,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                    Text("X", style: TextStyles.font10mainColorBold),
                                    Text("${order.cartItems![index].amount}",
                                        style: TextStyles.font13mainColorBold,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(color: AppColors.lightGrayColor),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 8.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  order.cartItems![index].additionals!.isEmpty
                                      ? AppConstants.noAdditionalsText
                                      : order.cartItems![index].additionals
                                      !.map((i) => "${i.name} X ${i.amount}")
                                      .join(", "),
                                  style: TextStyles.font13whiteBold,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                  height: 30.h,
                                  width: 50.w,
                                  child: Center(
                                      child: Text(AppConstants.additionalsTXT,
                                          style: TextStyles.font13whiteBold,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EndUserPhone(AppConstants.endUserPhoneTXT, order.endUserPhone),
                EndUserAddress(AppConstants.endUserAddressTXT, order.endUserAddress),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
