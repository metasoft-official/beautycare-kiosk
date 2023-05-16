import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_text.dart';

class AppButtonTheme {
  static final basicElevatedButtonTheme = ElevatedButton.styleFrom(
      backgroundColor: AppColor.appColor,
      foregroundColor: Colors.white,
      textStyle: AppTextTheme.elevatedButton,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
  static final roundedElevatedButtonTheme = ElevatedButton.styleFrom(
      backgroundColor: AppColor.appColor,
      foregroundColor: Colors.white,
      textStyle: AppTextTheme.elevatedButton,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)));
  static final darkElevatedButtonTheme = ElevatedButton.styleFrom(
    backgroundColor: AppColor.darkButtonColor,
    foregroundColor: Colors.white,
    textStyle: AppTextTheme.elevatedButton,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
      side: const BorderSide(color: AppColor.darkButtonColor),
    ),
  );
}
