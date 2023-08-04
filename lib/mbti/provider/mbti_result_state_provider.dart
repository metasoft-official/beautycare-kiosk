import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mbtiResultStateProvider = ChangeNotifierProvider<MbtiResultState>((ref) {
  return MbtiResultState();
});

class MbtiResultState extends ChangeNotifier {
  CarouselController carouselController = CarouselController();
  int curIndex = 0;

  bool isDetailClicked = false;

  clickDetailBtn() {
    isDetailClicked = isDetailClicked == false ? true : false;
    resetState();
  }

  List<String> fourType = ['지건성', '색소', '민감', '주름'];

  // 전문점 list
  List<Map<String, dynamic>> clinicList = [
    {
      'name': '파인드피부과 의원',
      'address': '서울특별시',
      'description':
          '만족도 높은 고객 맞춤 안티에이징 시술 결과를 위해 시술 전 단계에서 시술 후 아스트로돔 페이셜 프로그램까지 옥시젠 슈티컬스와 함께 합니다.',
      'img': 'assets/images/clinic_sample_01.jpg',
    },
    {
      'name': 'V&MJ 피부과',
      'address': '서울특별시',
      'description':
          '다양한 레이저 및 피부 시술 이후에 완성도 높은 효과를 위해 아스트로돔 페이셜과 하이풀디엠을 이용한 포스트케어를 진행하고 있습니다.',
      'img': 'assets/images/clinic_sample_02.jpg',
    },
    {
      'name': 'V&MJ 피부과',
      'address': '서울특별시',
      'description':
          '다양한 레이저 및 피부 시술 이후에 완성도 높은 효과를 위해 아스트로돔 페이셜과 하이풀디엠을 이용한 포스트케어를 진행하고 있습니다.',
      'img': 'assets/images/clinic_sample_03.jpg',
    },
    {
      'name': '파인드피부과 의원',
      'address': '서울특별시',
      'description':
          '만족도 높은 고객 맞춤 안티에이징 시술 결과를 위해 시술 전 단계에서 시술 후 아스트로돔 페이셜 프로그램까지 옥시젠 슈티컬스와 함께 합니다.',
      'img': 'assets/images/clinic_sample_01.jpg',
    },
    {
      'name': 'V&MJ 피부과',
      'address': '서울특별시',
      'description':
          '다양한 레이저 및 피부 시술 이후에 완성도 높은 효과를 위해 아스트로돔 페이셜과 하이풀디엠을 이용한 포스트케어를 진행하고 있습니다.',
      'img': 'assets/images/clinic_sample_02.jpg',
    },
    {
      'name': 'V&MJ 피부과',
      'address': '서울특별시',
      'description':
          '다양한 레이저 및 피부 시술 이후에 완성도 높은 효과를 위해 아스트로돔 페이셜과 하이풀디엠을 이용한 포스트케어를 진행하고 있습니다.',
      'img': 'assets/images/clinic_sample_03.jpg',
    },
  ];

  // 예측결과 model
  List<Map<String, dynamic>> result = [
    {
      'skinMbtiName': 'DSPT',
      'descriptionEng': 'Dry, Sensitive, Pigment, Tight',
      'subtitle': '민감하고 색소침착이 잘 되는 건성피부!',
      'description': '건조+민감함을 관리하고, 색소침착을 예방하는 데 중점을 두어야 합니다.',
      'skinMbtiKeyword': ['건조', '색소침착', '민감'],
      'skinMbtiCareTip': [
        '오일 베이스의 보습력 있는 클렌저 사용하기',
        '보습제를 자주 발라 보습력 유지하기',
        '무기자차 자외선 차단제 사용하기',
      ],
      'score': {'지건성': 78.0, '민감': 44.6, '색소': 47.5, '주름': 50.9}
    }
  ];

  List<List<String>> types = [
    ['건성 피부', '지성 피부'],
    ['저항성 강한 피부', '매우 민감한 피부'],
    ['비색소성', '색소성'],
    ['탄력 피부', '주름 취약 피부']
  ];

  // 예측결과 제품 추천
  List<Map<String, dynamic>> recProduct = [
    {
      'image': 'assets/images/sample_c_01.png',
      'category': '포스트케어',
      'name': 'PP크림 (Post Procedure Cream) 50ml',
      'price': '90,000',
    }
  ];

  changePage(int index) {
    curIndex = index;
    resetState();
  }

  void resetState() {
    MbtiResultState();
    notifyListeners();
  }
}
