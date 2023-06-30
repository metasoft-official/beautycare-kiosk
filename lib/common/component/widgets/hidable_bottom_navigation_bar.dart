import 'package:beauty_care/common/component/mixins/hide_navigation_bar_mixin.dart';
import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:flutter/material.dart';

class HidableBottomNavigationBarWidget extends StatelessWidget {
  final Color buttonColor;
  final TextStyle textStyle;

  final String label;
  final HideNavbar hiding;

  final VoidCallback onPressed;

  // final Widget child;

  const HidableBottomNavigationBarWidget({
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
    return ValueListenableBuilder(
      valueListenable: hiding.visible,
      builder: (context, bool value, child) => AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: value ? kBottomNavigationBarHeight : 0.0,
          child: ButtonBottomNavigationBarWidget(
              buttonColor: buttonColor,
              textStyle: textStyle,
              label: label,
              hiding: hiding,
              onPressed: onPressed)),
    );
  }
}

//
