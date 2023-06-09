import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 해당 키를 가진 위젯 렌더박스 사이즈와 위치를 맵으로 반환
final widgetInfoProvider =
    StateProvider.family<Map<String, dynamic>, GlobalKey>((ref, key) {
  if (key.currentContext != null) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    return {'size': size, 'offset': offset};
  }

  return {'size': Size.zero, 'offset': Offset.zero};
});
