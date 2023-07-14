import 'package:flutter/material.dart';

class ButtonBottomNavigationBarWidget extends StatelessWidget {
  const ButtonBottomNavigationBarWidget(
      {super.key,
      // required this.child,
      required this.buttonColor,
      required this.textStyle,
      required this.label,
      required this.onPressed,
      this.icon});

  final Color buttonColor;
  final String label;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  final Icon? icon;

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null) ...[icon!],
              TextButton(
                onPressed: onPressed,
                child: Text(label, style: textStyle),
              ),
            ],
          ),
        ));
  }
}

//
