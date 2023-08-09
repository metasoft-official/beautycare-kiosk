import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SurveyProgressState extends StateNotifier<SurveyProgressData> {
  SurveyProgressState() : super(SurveyProgressData.initial());

  // 정답을 선택하는 경우
  void selectAnswer(int questionIndex, int answerIndex) {
    state = state.copyWith(
        isClicked: [...state.isClicked]..[questionIndex] = answerIndex + 1);
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
    state = SurveyProgressData.initial();
  }
}

class SurveyProgressData {
  List<IconData> icons = [
    Icons.water_drop,
    Icons.warning,
    Icons.colorize,
    Icons.waves
  ];
  final List<int> isClicked;
  final int curStep;

  SurveyProgressData({required this.isClicked, required this.curStep});

  SurveyProgressData.initial()
      : isClicked = List<int>.filled(10, 0, growable: false),
        curStep = 0;

  SurveyProgressData copyWith({List<int>? isClicked, int? curStep}) {
    return SurveyProgressData(
      isClicked: isClicked ?? this.isClicked,
      curStep: curStep ?? this.curStep,
    );
  }
}
