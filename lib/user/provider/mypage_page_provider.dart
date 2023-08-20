import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mypageStateProvider = ChangeNotifierProvider<MypageState>((ref) {
  return MypageState();
});

class MypageState extends ChangeNotifier {
  List<Map<String, dynamic>> histories = [
    {
      'id': 5,
      'title': 'DRPT',
      'caption': 'Oily, Resistant, Non-pigmented, Tight',
      'imgUrl': 'assets/images/emoji_sample_profile.png',
      'date': '2023.06.08'
    },
    {
      'id': 6,
      'title': 'ORPS',
      'caption': 'Oily, Resistant, Non-pigmented, Tight',
      'imgUrl': 'assets/images/sample_images_02.png',
      'date': '2023.06.01'
    },
    {
      'id': 1,
      'title': '습진',
      'caption': 'eczema',
      'imgUrl': 'assets/images/sample_images_03.png',
      'date': '2023.05.20'
    },
  ];
  List<bool> isLongClicked =
      List<bool>.filled(3, false); //length == histories.length -> await 사용
  int longClickState = -1;

  void resetState() {
    MypageState();
    notifyListeners();
  }
}
