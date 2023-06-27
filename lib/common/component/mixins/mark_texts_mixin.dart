import 'package:flutter/cupertino.dart';

List<TextSpan> markTextsMixin(
    String text, String markText, TextStyle textStyle) {
  List<TextSpan> spans = [];
  List<String> plainTexts = [];

  // 마킹할 텍스트 기준으로 분리
  plainTexts = text.split(markText);

  // 마킹할 인덱스 검색
  final startIndex = text.indexOf(markText);
  final markedText = text.substring(startIndex, startIndex + markText.length);

  // 마킹 스타일 추가
  final markedTextSpan = TextSpan(text: markedText, style: textStyle);

  if (markText.length != text.length) {
    // 마킹할 텍스트가 전체 길이가 아닐 때
    if (startIndex == 0) {
      // 처음에 있음
      spans.add(markedTextSpan);
      for (var e in plainTexts) {
        spans.add(TextSpan(text: e));
      }
    } else if (startIndex != 0 && startIndex != text.length - markText.length) {
      // 중간에 있음
      spans.add(TextSpan(text: plainTexts[0]));
      spans.add(markedTextSpan);
      spans.add(TextSpan(text: plainTexts[1]));
    } else {
      // 끝에 있음
      for (var e in plainTexts) {
        spans.add(TextSpan(text: e));
      }
      spans.add(markedTextSpan);
    }
  } else {
    // 전체 길이와 같음
    spans.add(markedTextSpan);
  }

  return spans;
}
