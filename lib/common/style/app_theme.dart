import 'package:flutter/material.dart';

import 'app_button_theme.dart';
import 'app_color.dart';
import 'app_text.dart';

final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      titleTextStyle: AppTextTheme.appBarTitle),
  elevatedButtonTheme:
      ElevatedButtonThemeData(style: AppButtonTheme.basicElevatedButtonTheme),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: AppTextTheme.hintText,
    contentPadding: EdgeInsets.symmetric(horizontal: 14),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide.none),
    filled: true,
    fillColor: Colors.white,
  ),
  toggleButtonsTheme: const ToggleButtonsThemeData(
    color: AppColor.unselectedToggleColor,
    borderColor: AppColor.unselectedToggleBorderColor,
    selectedColor: Colors.white,
    fillColor: AppColor.selectedToggleColor,
    textStyle: AppTextTheme.elevatedButton,
  ),
);
