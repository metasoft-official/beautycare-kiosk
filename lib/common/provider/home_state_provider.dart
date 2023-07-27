import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:carousel_slider/carousel_controller.dart';

import '../../main.dart';

final homeStateProvider = ChangeNotifierProvider<HomeState>((ref) {
  return HomeState();
});

class HomeState extends ChangeNotifier {
  // 배너 현재 인덱스
  int bannerCurIndex = 0;
  // 제품 현재 인덱스
  int mainTypeCurIndex = 0; //main
  int productTypeCurIndex = 0; //cosmetic
  int productLineCurIndex = 0; //cosmetic

  // 배너 슬라이드 컨트롤러
  CarouselController crouselController = CarouselController();

  // category
  List<String> typeCategories = [
    '민감피부',
    '건성피부/수분',
    '지성피부/트러블',
    '피부탄력/영양',
    '브라이트닝',
    '포스트케어'
  ];
  List<String> lineCategories = [
    '클렌징/필링',
    '토너',
    '에센스/세럼',
    '크림',
    '마스크/바디',
    '비비/썬크림'
  ];

  // caption
  List<String> typeCaptions = [
    '외부 자극으로 인해 예민해진 피부에 보호력을 높여 건강한 피부로 케어해줍니다.',
    '피부에 부족한 수분을 공급하여 수분 보습 막을 채워주고 피부를 촉촉하게 유지해 줍니다.',
    '모공, 과도한 피지가 고민인 피부에 원인을 바로잡고 피부 방어력을 높여 정상화시켜 줍니다.',
    '얼굴에 굴곡진 주름과 균형이 깨진 피부 톤을 바로잡아 탄력 있는 피부로 가꾸어 줍니다.',
    '칙칙하고 푸석한 피부 결+톤을 정화하여 맑고 투명한 피부로 가꾸어줍니다.',
    '시술 후 자극으로 피부 표피층이 얇아져 민감해진 피부에 수분을 채워주고 피부 장벽을 강화시켜 회복해 줍니다.'
  ];

  // images
  List<String> images = [
    'assets/images/민감피부.jpg',
    'assets/images/건성피부,수분.jpg',
    'assets/images/지성피부,트러블.jpg',
    'assets/images/피부탄력,영양.jpg',
    'assets/images/브라이트닝.jpg',
    'assets/images/포스트케어.jpg',
  ];

  List<Map<String, dynamic>> typeProducts = [
    {
      'image': 'assets/images/sample_c_02.png',
      'category': '건성피부/수분',
      'name': '모이스춰 아쿠아세럼 50ml',
      'price': '75,000',
    },
    {
      'image': 'assets/images/sample_c_03.png',
      'category': '건성피부/수분',
      'name': '하이드레이팅 크림 50ml',
      'price': '88,000',
    }
  ];
  List<Map<String, dynamic>> lineProducts = [
    {
      'image': 'assets/images/sample_c_01.png',
      'category': '건성피부/수분',
      'name': '에이셀300 플루이드 50ml',
      'price': '95,000',
    },
    {
      'image': 'assets/images/sample_c_02.png',
      'category': '건성피부/수분',
      'name': '모이스춰 아쿠아세럼 50ml',
      'price': '75,000',
    },
    {
      'image': 'assets/images/sample_c_03.png',
      'category': '건성피부/수분',
      'name': '하이드레이팅 크림 50ml',
      'price': '88,000',
    }
  ];

  // 피부 고민 키워드
  List<String> keywords = [
    '건조',
    '색소침착',
    '트러블',
    '민감',
    '건조',
    '색소침착',
    '트러블',
    '민감'
  ];

  void resetState() {
    HomeState();
    notifyListeners();
  }
}
