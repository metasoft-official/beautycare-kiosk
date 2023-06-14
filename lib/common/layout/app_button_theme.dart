import 'package:flutter/material.dart';

import '../layout/app_color.dart';
import '../layout/app_text.dart';

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
  static final outlinedBasicButtonTheme = OutlinedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: AppColor.appColor,
    side: const BorderSide(color: AppColor.appColor),
    textStyle: AppTextTheme.black14,
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  );
  static final outlinedRoundedButtonTheme = OutlinedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: AppColor.appColor,
    side: const BorderSide(color: AppColor.appColor),
    textStyle: AppTextTheme.black14,
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(35),
    ),
  );
  static final outlinedRoundedLightButtonTheme = OutlinedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: AppColor.appColor,
    side: const BorderSide(color: AppColor.appColor),
    textStyle: AppTextTheme.black14,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(35),
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButton.styleFrom(
    backgroundColor: AppColor.darkButtonColor,
    foregroundColor: Colors.white,
    textStyle: AppTextTheme.elevatedButton,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
      side: const BorderSide(color: AppColor.darkButtonColor),
    ),
  );
  static final basicTextButtonTheme = TextButton.styleFrom(
    foregroundColor: AppColor.textButtonColor,
    textStyle: AppTextTheme.textButton,
    // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  );
}
