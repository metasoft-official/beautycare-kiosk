import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final productStateProvider = ChangeNotifierProvider<ProductState>((ref) {
  return ProductState();
});

class ProductState extends ChangeNotifier {
  int stateIndex = 0;

  List<String> titles = ['전체', '피부타입별', '사용단계별'];

  CarouselController carouselController = CarouselController();

  List<String> promotionList = [
    'assets/images/sample_images_01.png',
    'assets/images/sample_images_02.png'
  ];
  int curIndex = 0;

  changePage(int index) {
    curIndex = index;
    resetState();
  }

  Future<void> openWeb(String productUrl) async {
    Uri url = Uri.parse(productUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void resetState() {
    ProductState();
    notifyListeners();
  }
}
