import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/layout/app_text.dart';
import '../provider/quiz_state_provider.dart';

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
