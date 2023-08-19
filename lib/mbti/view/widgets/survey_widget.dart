import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/mbti/provider/survey_state_provider.dart';
import 'package:beauty_care/mbti/model/survey_question_model.dart';

import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/layout/app_color.dart';

import '../../../main.dart';

class SurveyWidget extends ConsumerWidget {
  SurveyWidget(
      {Key? key,
      required this.questionList,
      required this.isClicked,
      required this.questionCode})
      : super(key: key);

  int questionCode;
  final Map<String, dynamic> isClicked;
  final Map<String, dynamic> questionList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = questionList['$questionCode'];
    final progressState =
        ref.watch(surveyProgressStateProvider(isClicked).notifier);
    final progressData = ref.watch(surveyProgressStateProvider(isClicked));

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
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
                      opacity: progressData.isClicked[index] == 0 ? 1 : 0.35,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border:
                                Border.all(color: AppColor.appColor, width: 2)),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '${index + 1}',
                            style: AppTextTheme.blue14b.copyWith(height: 1.2),
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
                                questions[index].question ?? '-',
                                style: progressData.isClicked[index] == 0
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
                        if (progressData.isClicked['$questionCode'][index] ==
                            0) ...[
                          ListView.builder(
                              shrinkWrap: true,
                              primary: false, //스크롤 제한
                              itemCount:
                                  questions[index].surveyAnswerList?.length,
                              itemBuilder:
                                  (BuildContext context, int answerIndex) {
                                return Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 4, 10, 0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      progressState.selectAnswer(
                                          questionCode, index, answerIndex);
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
                                            questions[index]
                                                    .surveyAnswerList?[
                                                        answerIndex]
                                                    .answer ??
                                                '-',
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
                                progressState.selectAnswer(
                                    questionCode, index, -1);
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            questions[index]
                                                    .surveyAnswerList?[progressData
                                                                    .isClicked[
                                                                '$questionCode']
                                                            [index] -
                                                        1]
                                                    .answer ??
                                                '-',
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
        },
        childCount: isClicked['$questionCode'].length,
      ),
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
