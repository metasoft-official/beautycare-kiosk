import 'package:flutter/cupertino.dart';

import 'package:beauty_care/common/component/mixins/mark_texts_mixin.dart';

class MarkTextsWidget extends StatelessWidget {
  const MarkTextsWidget({
    Key? key,
    required this.defaultTextStyle,
    required this.text,
    required this.markText,
    required this.markTextStyle,
  }) : super(key: key);

  final TextStyle defaultTextStyle;
  final String text;
  final String markText;
  final TextStyle markTextStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: defaultTextStyle,
        children: markTextsMixin(text, markText, markTextStyle),
      ),
    );
  }
}
