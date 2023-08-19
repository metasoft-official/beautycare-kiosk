import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';

class SurveyProgressState extends StateNotifier<SurveyProgressData> {
  Map<String, dynamic> map;

  SurveyProgressState(this.map) : super(SurveyProgressData.initial(map));

  void selectAnswer(int questionCode, int questionIndex, int answerIndex) {
    state = state.copyWith(isClicked: {
      ...state.isClicked,
      '$questionCode': [
        ...state.isClicked['$questionCode']..[questionIndex] = answerIndex + 1
      ]
    });
  }

  // curStep 증가
  void increaseStep() {
    if (state.curStep < 3) {
      state = state.copyWith(curStep: state.curStep + 1);
    }
  }

  // curStep 감소
  void decreaseStep() {
    if (state.curStep > 0) {
      state = state.copyWith(curStep: state.curStep - 1);
    }
  }

  // 상태를 초기화하는 경우
  void resetState() {
    state = SurveyProgressData.initial(map);
  }
}

class SurveyProgressData {
  List<IconData> icons = [
    Icons.water_drop,
    Icons.warning,
    Icons.colorize,
    Icons.waves
  ];
  final Map<String, dynamic> isClicked; // 정답 선택
  final int curStep; // category code

  SurveyProgressData({required this.isClicked, required this.curStep});

  SurveyProgressData.initial(Map<String, dynamic> map)
      : isClicked = map,
        curStep = 0;

  SurveyProgressData copyWith({Map<String, dynamic>? isClicked, int? curStep}) {
    return SurveyProgressData(
      isClicked: isClicked ?? this.isClicked,
      curStep: curStep ?? this.curStep,
    );
  }
}
