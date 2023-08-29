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
      state = state.copyWith(curStep: state.curStep + 1, curQuestion: 0);
    }
  }

  // kiosk : 다음 질문
  void increaseQuestion() {
    state = state.copyWith(curQuestion: state.curQuestion + 1);
  }

  // curStep 감소
  void decreaseStep(int questionCode) {
    if (state.curStep > 0) {
      state = state.copyWith(
          curStep: state.curStep - 1,
          curQuestion: state.isClicked['${questionCode - 1}'].length - 1);
    }
  }

  // kiosk : 이전 질문
  void decreaseQuestion() {
    state = state.copyWith(curQuestion: state.curQuestion - 1);
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
  final int curQuestion; // kiosk 현재 질문 항목

  SurveyProgressData(
      {required this.isClicked,
      required this.curStep,
      required this.curQuestion});

  SurveyProgressData.initial(Map<String, dynamic> map)
      : isClicked = map,
        curStep = 0,
        curQuestion = 0;

  SurveyProgressData copyWith(
      {Map<String, dynamic>? isClicked, int? curStep, int? curQuestion}) {
    return SurveyProgressData(
        isClicked: isClicked ?? this.isClicked,
        curStep: curStep ?? this.curStep,
        curQuestion: curQuestion ?? this.curQuestion);
  }
}
