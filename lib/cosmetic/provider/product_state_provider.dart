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

  List<String> troubleCategories = [
    '민감',
    '건성/수분',
    '지성/트러블',
    '탄력/영양',
    '미백',
    '시술 후 처치'
  ];
  String troubleSelectedValue = '';
  String periodSelectedValue = '';

  selectDropdown(String? category, String? value) {
    if (value != null) {
      if (category == 'touble') {
        troubleSelectedValue = value;
      } else if (category == 'period') {
        periodSelectedValue = value;
      }
      notifyListeners();
    }
  }

  List<Map<String, dynamic>> products = [
    {
      'name': '모이스춰 아쿠아세럼 50ml',
      'price': '70,000',
      'image': 'assets/images/sample_c_01.png',
      'skintypeCategory': '건성피부/수분',
      'productUrl': 'https://oxygenceuticals.co.kr/surl/P/24'
    },
    {
      'name': '에이셀 모이스춰 키트',
      'price': '59,000',
      'image': 'assets/images/sample_c_02.png',
      'skintypeCategory': '건성피부/수분',
      'productUrl': 'https://oxygenceuticals.co.kr/surl/P/24'
    },
    {
      'name': '에이셀 모이스춰 키트',
      'price': '59,000',
      'image': 'assets/images/sample_c_03.png',
      'skintypeCategory': '건성피부/수분',
      'productUrl': 'https://oxygenceuticals.co.kr/surl/P/24'
    },
    {
      'name': '모이스춰 아쿠아세럼 50ml',
      'price': '67,000',
      'image': 'assets/images/sample_c_04.png',
      'skintypeCategory': '건성피부/수분',
      'productUrl': 'https://oxygenceuticals.co.kr/surl/P/24'
    }
  ];

  List<Map<String, dynamic>> lankProducts = [
    {
      'name': '에이셀300 플루이드 50ml',
      'price': '95,000',
      'image': 'assets/images/sample_c_01.png',
      'skintypeCategory': '건성피부/수분',
      'productUrl': 'https://oxygenceuticals.co.kr/surl/P/24'
    },
    {
      'name': '모이스춰 아쿠아세럼 50ml',
      'price': '75,000',
      'image': 'assets/images/sample_c_02.png',
      'skintypeCategory': '건성피부/수분',
      'productUrl': 'https://oxygenceuticals.co.kr/surl/P/24'
    },
    {
      'name': '하이드레이팅 크림 50ml',
      'price': '88,000',
      'image': 'assets/images/sample_c_03.png',
      'skintypeCategory': '건성피부/수분',
      'productUrl': 'https://oxygenceuticals.co.kr/surl/P/24'
    }
  ];

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
