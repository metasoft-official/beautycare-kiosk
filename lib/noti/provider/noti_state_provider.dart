import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

final notiStateProvider = ChangeNotifierProvider<NotiState>((ref) {
  return NotiState();
});

class NotiState extends ChangeNotifier {
  // 알림 리스트
  List<String>? notiList;

  //초기
  NotiState() {
    notiList = List<String>.filled(2, '알림', growable: false);
  }

  void resetState() {
    notifyListeners();
  }
}
