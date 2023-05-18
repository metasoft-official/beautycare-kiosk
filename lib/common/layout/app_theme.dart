import 'package:flutter/material.dart';

import 'app_button_theme.dart';
import '../layout/app_color.dart';
import '../layout/app_text.dart';

final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      titleTextStyle: AppTextTheme.appBarTitle),
  elevatedButtonTheme:
      ElevatedButtonThemeData(style: AppButtonTheme.basicElevatedButtonTheme),
  textButtonTheme:
      TextButtonThemeData(style: AppButtonTheme.basicTextButtonTheme),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: AppTextTheme.hintText,
    contentPadding: EdgeInsets.symmetric(horizontal: 14),
    border:
        OutlineInputBorder(borderSide: BorderSide(color: AppColor.appColor)),
  ),
  toggleButtonsTheme: const ToggleButtonsThemeData(
    color: AppColor.unselectedToggleColor,
    borderColor: AppColor.unselectedToggleBorderColor,
    selectedColor: Colors.white,
    fillColor: AppColor.selectedToggleColor,
    textStyle: AppTextTheme.elevatedButton,
  ),
);
