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
  static const greyBoxTheme = BoxDecoration(
    color: AppColor.lightGrey,
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );

  // border
  static const outlinedBlueinputBorderTheme = OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.appColor, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(30)));
}
