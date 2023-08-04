import 'package:beauty_care/common/layout/app_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/mbti/provider/quiz_state_provider.dart';

class SurveyWidget extends ConsumerWidget {
  const SurveyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(quizStateProvider);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
          childCount: quizState.questions.length, (context, index) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(24, 36, 24, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 질문 번호
                  Opacity(
                    opacity: quizState.isClicked[index] == 0 ? 1 : 0.35,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border:
                              Border.all(color: AppColor.appColor, width: 2)),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          '${index + 1}',
                          style: AppTextTheme.blue14b.copyWith(height: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 질문 ===================================================
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 질문 내용
                            Expanded(
                                child: Text(
                              quizState.questions[index],
                              style: quizState.isClicked[index] == 0
                                  ? AppTextTheme.black14b
                                  : AppTextTheme.middleGrey14m,
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
                            itemBuilder:
                                (BuildContext context, int answerIndex) {
                              return Container(
                                margin: const EdgeInsets.fromLTRB(10, 4, 10, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    quizState.selectAnswer(index, answerIndex);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 12, 16, 12),
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: Row(
                                    children: [
                                      // todo 이미지도 받아서 사용
                                      Image.asset(
                                          'assets/images/character_coiz_3.png',
                                          width: 24),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          quizState.answers[index][answerIndex],
                                          maxLines: 5,
                                          style: AppTextTheme.black14m,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ] else ...[
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.fromLTRB(10, 4, 10, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              quizState.selectAnswer(index, -1);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.appColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.fromLTRB(16, 12, 16, 12),
                              shadowColor: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          'assets/images/character_coiz_3.png',
                                          width: 24),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          quizState.answers[index]
                                              [quizState.isClicked[index] - 1],
                                          style: AppTextTheme.white12m,
                                          maxLines: 5,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.cancel, size: 20)
                              ],
                            ),
                          ),
                        )
                      ],
                      const SizedBox(height: 10)
                    ]),
              ),
            ],
          ),
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
