import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../colors/colors.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments})
  {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments})
  {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments})
  {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop(true);
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}


String  generateUuid() {
  var uuid = const Uuid();
  return uuid.v4();
}

SizedBox verticalSpace(double height) => SizedBox(
  height: height.h,
);

SizedBox horizontalSpace(double width) => SizedBox(
  width: width.w,
);

extension DateTimeFormatter on DateTime {
  String toFormattedString() {
    return DateFormat("d/M/yyyy , h:mm a", "ar").format(this);
  }
}

extension StringDateParser on String {
  DateTime toDateTime() {
    return DateFormat("d/M/yyyy , h:mm a", "ar").parse(this);
  }
}

// String formatDateTime(DateTime dateTime) {
//   return DateFormat("d/M/yyyy , h:mm a", "ar").format(dateTime);
// }
// DateTime parseDateTime(String dateString) {
//   return DateFormat("d/M/yyyy , h:mm a", "ar").parse(dateString);
// }


Widget dividerVertical() =>  Container(
  padding: EdgeInsets.symmetric(vertical: 5.h),
  child: const Divider(color: AppColors.darktGrayColor,),
);
Widget dividerHorizontal() =>  Container(
  padding: EdgeInsets.symmetric(horizontal: 5.h),
  child: const Divider(color: AppColors.lightGrayColor,),
);
