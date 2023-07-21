import 'package:flutter/material.dart';

import 'app_color.dart';

class AppBoxTheme {
  // box
  static final basicShadowWhiteBoxTheme = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(15)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        blurRadius: 5.0,
        spreadRadius: 0,
        offset: const Offset(2, 4),
      )
    ],
  );
  static final outlinedRoundedBlueTransparentBoxTheme = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(30),
    border: Border.all(color: AppColor.appColor),
  );
  static final outlinedRoundedGreyWitheBoxTheme = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    border: Border.all(color: AppColor.lightGrey),
  );
  static final greyBoxTheme = BoxDecoration(
    color: AppColor.lightGrey,
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    border: Border.all(color: AppColor.semiGrey),
  );
  static final tabBarBoxTheme = BoxDecoration(
      color: Colors.white,
      border: Border.all(color: AppColor.appColor),
      borderRadius: const BorderRadius.all(Radius.circular(34)));

  // border
  static const outlinedBlueinputBorderTheme = OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.appColor, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(30)));
}
