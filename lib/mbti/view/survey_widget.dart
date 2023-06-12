import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/layout/app_text.dart';

final quizStateProvider = ChangeNotifierProvider<QuizState>((ref) {
  return QuizState();
});

class QuizState extends ChangeNotifier {
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
    '클렌징 후에 아무 것도 바르지 않고 2~3시간 후 밝은 빛 아래서 이마와 볼이 어떻게 보입니까?',
    '두 번째 질문?',
    '세 번째 질문입니다.'
  ];
  List<int> _isClicked = [];

  // 아무것도 선택되지 않은 상태
  QuizState() {
    _isClicked = List<int>.filled(questions.length, 0, growable: false);
  }

  List<int> get isClicked => _isClicked;

  // 정답을 선택하는 경우
  void selectAnswer(int questionIndex, int answerIndex) {
    _isClicked[questionIndex] = answerIndex + 1;
    notifyListeners();
  }
}

class SurveyWidget extends ConsumerWidget {
  const SurveyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(quizStateProvider);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
          childCount: quizState.questions.length, (context, index) {
        return Container(
          margin: const EdgeInsets.fromLTRB(24, 36, 24, 0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // 질문 ===================================================
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 질문 번호
                  Text(
                    'Q${index + 1}.',
                    style: AppTextTheme.deepGrey20,
                  ),
                  const SizedBox(width: 10),
                  // 질문 내용
                  Expanded(
                      child: Text(
                    quizState.questions[index],
                    style: AppTextTheme.black18b,
                  )),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // 한 질문에 대한 답변은 lazy 하게 나올 필요가 없다고 판단하여 ListView 사용
            // 답변 ===================================================
            if (quizState.isClicked[index] == 0) ...[
              ListView.builder(
                  shrinkWrap: true,
                  primary: false, //스크롤 제한
                  itemCount: quizState.answers[index].length,
                  itemBuilder: (BuildContext context, int answerIndex) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(10, 4, 10, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          quizState.selectAnswer(index, answerIndex);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                          shadowColor: Colors.transparent,
                        ),
                        child: Text(
                          quizState.answers[index][answerIndex],
                          style: AppTextTheme.black14m,
                        ),
                      ),
                    );
                  }),
            ] else ...[
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'A.',
                        style: AppTextTheme.blue14m,
                      ),
                      TextButton(
                        onPressed: () {
                          quizState.selectAnswer(index, -1);
                        },
                        style: TextButton.styleFrom(
                          shadowColor: Colors.transparent,
                        ),
                        child: Text(
                          quizState.answers[index]
                              [quizState.isClicked[index] - 1],
                          style: AppTextTheme.blue14m,
                        ),
                      )
                    ],
                  ))
            ],
            const SizedBox(height: 10)
          ]),
        );
      }),
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  PersistentHeader(
      {required this.widget, required this.minExtent, required this.maxExtent});

  final Widget widget;
  @override
  final double minExtent;
  @override
  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
