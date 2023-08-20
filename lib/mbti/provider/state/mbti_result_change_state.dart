import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';

class MbtiResultChangeState extends ChangeNotifier {
  //전문점 슬라이더
  CarouselController carouselController = CarouselController();
  int curIndex = 0;

  changePage(int index) {
    curIndex = index;
    resetState();
  }

  //자세히 보기
  bool isDetailClicked = false;

  clickDetailBtn() {
    isDetailClicked = isDetailClicked == false ? true : false;
    resetState();
  }

  void resetState() {
    MbtiResultChangeState();
    notifyListeners();
  }
}
