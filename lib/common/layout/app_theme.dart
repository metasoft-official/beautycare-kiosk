import 'package:flutter/material.dart';

import 'app_button_theme.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      titleTextStyle: AppTextTheme.appBarTitle),
  elevatedButtonTheme:
      ElevatedButtonThemeData(style: AppButtonTheme.basicElevatedButtonTheme),
  textButtonTheme:
      TextButtonThemeData(style: AppButtonTheme.basicTextButtonTheme),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: AppTextTheme.middleGrey12,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.appColor),
        borderRadius: BorderRadius.zero),
  ),
  toggleButtonsTheme: const ToggleButtonsThemeData(
    color: AppColor.unselectedToggleColor,
    borderColor: AppColor.unselectedToggleBorderColor,
    selectedColor: Colors.white,
    fillColor: AppColor.selectedToggleColor,
    textStyle: AppTextTheme.elevatedButton,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    // 인디케이터 색상 안 보이게
    // backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColor.darkGrey,
    unselectedItemColor: AppColor.darkGrey,
    selectedLabelStyle: AppTextTheme.tabBarText,
    unselectedLabelStyle: AppTextTheme.tabBarText,
  ),
  dividerTheme: const DividerThemeData(
    color: AppColor.lightGrey,
  ),
  scaffoldBackgroundColor: AppColor.appBackgroundColor,
  radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => AppColor.appColor)),
);
