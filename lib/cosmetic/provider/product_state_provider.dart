import 'package:beauty_care/cosmetic/provider/state/promotion_change_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final sliderChangeProvider =
    AutoDisposeChangeNotifierProvider<PromotionChangeState>((ref) {
  return PromotionChangeState();
});

final productStateProvider =
    AutoDisposeChangeNotifierProvider<ProductState>((ref) {
  return ProductState();
});

class ProductState extends ChangeNotifier {
  int stateIndex = 0;

  List<String> titles = ['전체', '피부타입별', '사용단계별'];

  List<String> promotionList = [
    'assets/images/promotion_banner_01.png',
    'assets/images/promotion_banner_02.png'
  ];

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
