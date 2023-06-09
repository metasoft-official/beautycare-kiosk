import 'package:flutter/material.dart';

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
}
