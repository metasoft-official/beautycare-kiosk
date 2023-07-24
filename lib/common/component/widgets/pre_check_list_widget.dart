import 'package:beauty_care/common/layout/app_text.dart';
import 'package:flutter/material.dart';

class PreCheckListWidget extends StatelessWidget {
  final String boldText;
  final String text;
  final String imgUrl;

  const PreCheckListWidget(
      {super.key,
      required this.boldText,
      required this.text,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth * 0.85,
        height: 64,
        // padding: const EdgeInsets.fromLTRB(0, 20, 0, 15), // padding
        margin: const EdgeInsets.fromLTRB(0, 12, 0, 0), // margin
        decoration: BoxDecoration(
          color: Colors.white, // background color
          // border: Border.all(color: Colors.black, width: 3), // border
          borderRadius: BorderRadius.circular(10.0), // border radius
          boxShadow: [
            // box shadow
            BoxShadow(
              color: Colors.grey.withOpacity(0.02),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(imgUrl, width: 25),
          const SizedBox(width: 20),
          Row(children: [
            Text(boldText, style: AppTextTheme.black16b),
            Text(text, style: AppTextTheme.black16)
          ]),
        ]),
      );
    });
  }
}
