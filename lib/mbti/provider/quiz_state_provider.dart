import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/main.dart';

final quizStateProvider = ChangeNotifierProvider<QuizState>((ref) {
  return QuizState();
});

class QuizState extends ChangeNotifier {
  // 질답 리스트
  final answers = [
    [
      '매우 거칠고, 버석거리고 각질이 들떠 보입니다.',
      '당깁니다.',
      '건조해 보이지 않고 번들거리지도 않습니다.',
      '밝은 빛에 반사되는 듯이 번들거립니다.'
    ],
    ['두번째 질문에 대한 답변 리스트', '두번째 질문에 대한 답변 어쩌구'],
    ['세번째 질문에 대한 답변 리스트', '테스트테스트']
  ];
  final questions = [
    '클렌징 후 아무것도 바르지 않고 2~3시간이 지나 밝은 빛 아래서 거울을 보면, 이마와 볼이 어떻게 보이고 느껴지나요?',
    '사진을 찍으면 얼굴에 유분기가 보이나요?',
    '파운데이션을 바른지 2~3시간 후의 얼굴 상태는 어떤가요?'
  ];

  // 질답 위젯 생성
  int curStep = 0;
  List<String> titles = ['수분', '민감', '색소', '주름'];
  List<IconData> icons = [
    Icons.water_drop,
    Icons.warning,
    Icons.colorize,
    Icons.waves
  ];

  // 답변 선택 여부
  List<int> _isClicked = [];

  // 아무것도 선택되지 않은 상태
  QuizState() {
    _isClicked = List<int>.filled(questions.length, 0, growable: false);
    curStep = 0;
  }

  List<int> get isClicked => _isClicked;

  // 정답을 선택하는 경우
  void selectAnswer(int questionIndex, int answerIndex) {
    _isClicked[questionIndex] = answerIndex + 1;
    notifyListeners();
  }

  // curStep 증가
  void increaseStep() {
    if (curStep < 3) {
      curStep += 1;
    }
    notifyListeners();
  }

  // curStep 감소
  void decreaseStep() {
    if (curStep > 0) {
      curStep -= 1;
    }
    notifyListeners();
  }

  void resetState() {
    QuizState();
    notifyListeners();
  }
}
