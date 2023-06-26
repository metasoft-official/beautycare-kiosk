import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final notiStateProvider = ChangeNotifierProvider<NotiState>((ref) {
  return NotiState();
});

class NotiState extends ChangeNotifier {
  // 알림 종류 리스트
  List<String> notiTypeList = [];
  // 알림 내용 리스트
  List<String> contentsList = [];
  // 알림 날짜 리스트
  List<String> notiDateList = [];
  // 알림 확인 여부
  List<bool> isCheckedNoti = [];

  //초기
  NotiState() {
    // todo : 값 받아서 적용
    notiTypeList = List<String>.filled(2, '알림', growable: false);
    contentsList = List<String>.filled(
        notiTypeList.length, '5월 19일 14:00 ~ 17:00에는 시스템 점검이 있습니다.',
        growable: false);
    notiDateList = List<String>.filled(notiTypeList.length,
        DateFormat('yyyy-MM-dd').parse(DateTime.now().toString()).toString(),
        growable: false);
    isCheckedNoti =
        List<bool>.filled(notiTypeList.length, false, growable: false);
  }

  void checkNoti(int index) {
    if (isCheckedNoti[index] == false) isCheckedNoti[index] = true;
    resetState();
    notifyListeners();
  }

  void resetState() {
    NotiState();

    // 테스트용
    // isCheckedNoti =
    //     List<bool>.filled(notiTypeList.length, false, growable: false);
    // contentsList[0] = '리셋 테스트';

    notifyListeners();
  }
}
