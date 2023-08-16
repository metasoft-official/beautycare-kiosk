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

  List<String> promotionList = [
    'assets/images/promotion_banner_01.png',
    'assets/images/promotion_banner_02.png'
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
  List<String> periods = ['오늘', '이번 주', '이번 달'];
  List<String> orders = ['인기순', '가격 낮은 순', '가격 높은 순'];
  String troubleSelectedValue = '민감';
  String periodSelectedValue = '오늘';
  String orderSelectedValue = '인기순';

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

  List<Map<String, dynamic>> clinics = [
    {
      'name': '엠레드 클리닉',
      'image': 'assets/images/clinic_logo_mred.png',
      'address': '서울특별시',
      'kakaotalkChannelLink': 'https://oxygenceuticals.co.kr/surl/P/24',
      'visibilityStatus': 'E'
    },
    {
      'name': '디알 피부과',
      'image': 'assets/images/clinic_logo_dr.png',
      'address': '서울특별시',
      'kakaotalkChannelLink': 'https://oxygenceuticals.co.kr/surl/P/24',
      'visibilityStatus': 'C'
    },
    {
      'name': '리젠 피부과',
      'image': 'assets/images/clinic_logo_rigen.gif',
      'address': '서울특별시',
      'kakaotalkChannelLink': 'https://oxygenceuticals.co.kr/surl/P/24',
      'visibilityStatus': 'C'
    },
    {
      'name': '아르케 의원',
      'image': 'assets/images/clinic_logo_arke.gif',
      'address': '서울특별시',
      'kakaotalkChannelLink': 'https://oxygenceuticals.co.kr/surl/P/24',
      'visibilityStatus': 'C'
    },
    {
      'name': '파인드 피부과',
      'image': 'assets/images/clinic_logo_find.png',
      'address': '서울특별시',
      'kakaotalkChannelLink': 'https://oxygenceuticals.co.kr/surl/P/24',
      'visibilityStatus': 'E'
    },
    {
      'name': '에르시아 의원',
      'image': 'assets/images/clinic_logo_ersia.png',
      'address': '서울특별시',
      'kakaotalkChannelLink': 'https://oxygenceuticals.co.kr/surl/P/24',
      'visibilityStatus': 'C'
    },
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
