import 'package:flutter/material.dart';

import '../../../../core/helpers/colors/colors.dart';

class MyTab extends StatelessWidget {
  String text;
   MyTab({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return  Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              color: AppColors.mainColor),
        ),
        child:  Align(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
