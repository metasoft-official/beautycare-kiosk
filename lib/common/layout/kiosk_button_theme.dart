import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:flutter/material.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

class KioskButtonTheme {
  static final basicElevatedButtonTheme = ElevatedButton.styleFrom(
      elevation: 0.0,
      backgroundColor: AppColor.appColor,
      foregroundColor: Colors.white,
      textStyle: KioskTextTheme.white48m,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));
  static final basicElevatedNoRoundedButtonTheme = ElevatedButton.styleFrom(
      elevation: 0.0,
      backgroundColor: AppColor.appColor,
      foregroundColor: Colors.white,
      textStyle: AppTextTheme.white12b.copyWith(height: 1.2),
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero));
  static final greyElevatedButtonTheme = ElevatedButton.styleFrom(
      elevation: 0.0,
      backgroundColor: AppColor.lowGrey,
      foregroundColor: Colors.black,
      textStyle: AppTextTheme.black16m,
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)));
  static final roundedElevatedButtonTheme = ElevatedButton.styleFrom(
      elevation: 0.0,
      backgroundColor: AppColor.appColor,
      foregroundColor: Colors.white,
      textStyle: AppTextTheme.elevatedButton,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)));
  static final outlinedBasicButtonTheme = OutlinedButton.styleFrom(
      elevation: 0.0,
      backgroundColor: Colors.white,
      foregroundColor: AppColor.appColor,
      side: const BorderSide(color: AppColor.appColor, width: 2),
      textStyle: KioskTextTheme.blue36m,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));
  static final outlinedRoundedButtonTheme = OutlinedButton.styleFrom(
    elevation: 0.0,
    backgroundColor: Colors.white,
    foregroundColor: AppColor.appColor,
    side: const BorderSide(color: AppColor.appColor),
    textStyle: AppTextTheme.black14,
    padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(35),
    ),
  );
  static final outlinedRoundedLightButtonTheme = OutlinedButton.styleFrom(
    elevation: 0.0,
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
    elevation: 0.0,
    backgroundColor: AppColor.darkButtonColor,
    foregroundColor: Colors.white,
    textStyle: AppTextTheme.elevatedButton,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
      side: const BorderSide(color: AppColor.darkButtonColor),
    ),
  );
  static final outlinedGreyTextButtonTheme = OutlinedButton.styleFrom(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      foregroundColor: AppColor.middleGrey,
      side: const BorderSide(color: AppColor.semiGrey),
      textStyle: AppTextTheme.middleGrey12m,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)));

  static final basicBlueTextButtonTheme = ElevatedButton.styleFrom(
      elevation: 0.0,
      backgroundColor: AppColor.appColor,
      foregroundColor: Colors.white,
      textStyle: AppTextTheme.blue12b,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)));
  static final basicTextButtonTheme = TextButton.styleFrom(
    elevation: 0.0,
    foregroundColor: AppColor.textButtonColor,
    textStyle: AppTextTheme.textButton,
    // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  );

  static final shootingIndicationButtonInactiveTheme = TextButton.styleFrom(
    minimumSize: const Size(400, 50),
    elevation: 0.0,
    backgroundColor: Colors.white.withOpacity(0.2),
    foregroundColor: AppColor.appColor.withOpacity(0.2),
    side: BorderSide(color: AppColor.appColor.withOpacity(0.2)),
    textStyle: KioskTextTheme.blue28b
        .copyWith(color: AppColor.appColor.withOpacity(0.5)),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
  );

  static final shootingIndicationButtonActiveTheme = TextButton.styleFrom(
    minimumSize: const Size(400, 50),
    elevation: 0.0,
    backgroundColor: Colors.white.withOpacity(0.5),
    foregroundColor: AppColor.appColor,
    side: const BorderSide(color: AppColor.appColor),
    textStyle: KioskTextTheme.blue28b,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
  );
}