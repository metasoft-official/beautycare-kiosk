import 'package:flutter/material.dart';

import 'app_color.dart';

class AppBoxTheme {
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
}
