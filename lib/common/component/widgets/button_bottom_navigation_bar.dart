import 'package:flutter/material.dart';

class ButtonBottomNavigationBarWidget extends StatelessWidget {
  final Color buttonColor;
  final TextStyle textStyle;

  final String label;

  final VoidCallback onPressed;

  const ButtonBottomNavigationBarWidget({
    super.key,
    // required this.child,
    required this.buttonColor,
    required this.textStyle,
    required this.label,
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
