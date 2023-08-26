import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';

class PromotionChangeState extends ChangeNotifier {
  int curIndex = 0;
  CarouselController carouselController = CarouselController();
  changePage(int index) {
    curIndex = index;
    notifyListeners();
  }
}
