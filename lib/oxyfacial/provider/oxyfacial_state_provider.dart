import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final oxyfacialStateProvider = ChangeNotifierProvider<OxyfacialState>((ref) {
  return OxyfacialState();
});

class OxyfacialState extends ChangeNotifier {
  List<Map<String, dynamic>> oxyfacials = [
    {
      'krName': '컨트롤Z페이셜',
      'engName': 'CTRLZFacial',
      'coverImage': 'assets/images/oxy_CtrlZFacial_main.jpg',
      'oxyfacialImage': 'assets/images/sample_m_1.png',
      'oxyUrl': 'https://oxygenceuticals.co.kr/surl/P/24',
      'description': '피부미용 시술 전 후 처치 시스템 & 비수술 초음파 프로그램',
      'keywords': ['옥시리버스', '스킨리페어']
    },
    {
      'krName': '아스트로돔페이셜',
      'engName': 'AstrodomeFacial',
      'coverImage': 'assets/images/oxy_AstrodomeFacial_main.jpg',
      'oxyfacialImage': 'assets/images/sample_m_2.png',
      'oxyUrl': 'https://oxygenceuticals.co.kr/surl/P/24',
      'description': '문제성 피부 상태에 따른 LED 맞춤형 관리',
      'keywords': ['우주인토닝', 'LPE관리']
    },
  ];

  void resetState() {
    OxyfacialState();
    notifyListeners();
  }
}
