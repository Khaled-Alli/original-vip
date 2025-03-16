import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:original_vip/core/helpers/colors/colors.dart';
import 'package:original_vip/core/helpers/constants/constants.dart';
import 'package:original_vip/core/helpers/themes/themes.dart';

import '../../model/laptop_model.dart';

class LaptopItem extends StatelessWidget {
  Laptop laptop;
   LaptopItem({super.key,required this.laptop});

  @override
  Widget build(BuildContext context) {
    return Container(
   width: 340.w,
      height: 90.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius:const BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16),),
              child: Opacity(
              opacity: 0.6,
              child:  Image.asset(AppConstants.appIconImagePath,width: 100.w,height: 150.w,fit: BoxFit.fill,),
              )
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              SizedBox(
                width: 210.w,
                child: Row(children: [
                  SizedBox(
                    width:125.w,
                      child: Text(laptop.name,style: TextStyles.font13whiteBold ,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                  Spacer(),
                  SizedBox(
                      width: 60.w,
                      child: Text(laptop.processor,style: TextStyles.font13whiteBold,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                ],),
              ),
              SizedBox( width: 210.w,child: Text(laptop.viga,style: TextStyles.font13whiteBold,maxLines: 1,overflow: TextOverflow.ellipsis,)),
              SizedBox(
                width: 210.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  SizedBox(
                      width: 45.w,
                      child: Text(laptop.ram,style: TextStyles.font13whiteBold,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                  SizedBox(
                      width: 50.w,
                      child: Text(laptop.hard,style: TextStyles.font13whiteBold,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                  SizedBox( width: 62.w,child: Text("${laptop.price} L.E",style: TextStyles.font13mainColorBold,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                ],),
              ),
            ],),
          ),
        ],
      ),
    );
  }
}
