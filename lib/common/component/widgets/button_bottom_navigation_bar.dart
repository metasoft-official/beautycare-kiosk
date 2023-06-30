import 'package:beauty_care/common/component/mixins/hide_navigation_bar_mixin.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:flutter/material.dart';

class ButtonBottomNavigationBarWidget extends StatelessWidget {
  final Color buttonColor;
  final TextStyle textStyle;

  final String label;
  final HideNavbar hiding;

  final VoidCallback onPressed;

  const ButtonBottomNavigationBarWidget({
    super.key,
    // required this.child,
    required this.buttonColor,
    required this.textStyle,
    required this.label,
    required this.hiding,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 60,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: buttonColor,
          ),
          child: TextButton(
            onPressed: onPressed,
            child: Text(label, style: textStyle),
          ),
        ));
  }
}

//
