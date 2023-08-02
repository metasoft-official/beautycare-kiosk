import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final historyStateProvider = ChangeNotifierProvider<HistoryState>((ref) {
  return HistoryState();
});

class HistoryState extends ChangeNotifier {
  int stateIndex = 0;

  List<String> titles = ['전체', '피부질환', '피부MBTI'];
  List<Map<String, dynamic>> mbtiHistories = [
    {
      'title': 'DRPT',
      'caption': 'Oily, Resistant, Non-pigmented, Tight',
      'imgUrl': 'assets/images/emoji_sample_profile.png',
      'date': '2023.06.08'
    },
    {
      'title': 'ORPS',
      'caption': 'Oily, Resistant, Non-pigmented, Tight',
      'imgUrl': 'assets/images/sample_images_02.png',
      'date': '2023.06.01'
    },
  ];
  List<Map<String, dynamic>> skinHistories = [
    {
      'title': '습진',
      'caption': 'eczema',
      'imgUrl': 'assets/images/sample_images_03.png',
      'date': '2023.05.20'
    },
  ];

  void resetState() {
    HistoryState();
    notifyListeners();
  }
}
