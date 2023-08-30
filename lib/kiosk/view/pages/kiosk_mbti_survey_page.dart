import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/mbti/provider/survey_state_provider.dart';

import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/kiosk/view/widgets/kiosk_app_bar.dart';
import 'package:beauty_care/kiosk/view/widgets/kiosk_bottom_button_widget.dart';
import 'package:beauty_care/common/component/widgets/icon_stepper_widget.dart';
import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';

import '../../../main.dart';

class KioskMbtiSurveyPage extends ConsumerStatefulWidget {
  const KioskMbtiSurveyPage({super.key});

  static String get routeName => 'kioskSurvey';

  @override
  KioskMbtiSurveyState createState() => KioskMbtiSurveyState();
}

class KioskMbtiSurveyState extends ConsumerState<KioskMbtiSurveyPage> {
  @override
  Widget build(BuildContext context) {
    final rootContext = context;
    logger.d(context.hashCode);
    final asyncValue = ref.watch(surveyStateProvider);
    final surveyData = ref.watch(surveyStateProvider.notifier);

    return asyncValue.when(
      data: (data) {
        final surveyState =
            ref.watch(surveyProgressStateProvider(data['isClicked']).notifier);
        final surveyProgressData =
            ref.watch(surveyProgressStateProvider(data['isClicked']));
        final questions = data['questions'];
        final questionCode = surveyProgressData.curStep + 6;
        final index = surveyProgressData.curQuestion;

        return Scaffold(
          backgroundColor: AppColor.lightGrey,
          body: Column(
            children: [
              const KioskAppBar(
                color: Colors.transparent,
              ),
              // 문진 카테고리
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 72),
                child: SizedBox(
                  height: 150,
                  child: IconStepperWidget(
                    isKiosk: true,
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    color: AppColor.appColor,
                    curStep: surveyProgressData.curStep,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 72),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(24, 36, 24, 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      '${surveyProgressData.curQuestion + 1}.',
                      style: KioskTextTheme.blue36b,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 72),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 질문 내용
                      Expanded(
                          child: Text(
                              questions['$questionCode'][index].question ?? '-',
                              style: KioskTextTheme.black28b)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 답변 ===================================================

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: true, //스크롤 제한
                  itemCount: questions['$questionCode'][index]
                      .surveyAnswerList
                      ?.length,
                  itemBuilder: (BuildContext context, int answerIndex) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(72, 20, 72, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          // 답변 클릭
                          surveyState.selectAnswer(
                              questionCode,
                              index,
                              surveyProgressData.isClicked['$questionCode']
                                          [index] !=
                                      answerIndex + 1
                                  ? answerIndex
                                  : -1);

                          // 다음 질문으로 바로 이동
                          if (index < questions['$questionCode'].length - 1) {
                            surveyState.increaseQuestion();
                          }
                          // 스텝의 마지막 질문인 경우
                          else {
                            // 데이터 업데이트
                            data['isClicked']['$questionCode'] =
                                surveyProgressData.isClicked['$questionCode'];
                            // 다음 스텝
                            if (surveyProgressData.curStep < 3) {
                              surveyState.increaseStep();
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: surveyProgressData
                                      .isClicked['$questionCode'][index] !=
                                  answerIndex + 1
                              ? Colors.white
                              : AppColor.appColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                          shadowColor: Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      'assets/images/character_coiz_3.png',
                                      width: 50),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      questions['$questionCode'][index]
                                              .surveyAnswerList?[answerIndex]
                                              .answer ??
                                          '-',
                                      style: surveyProgressData.isClicked[
                                                  '$questionCode'][index] !=
                                              answerIndex + 1
                                          ? KioskTextTheme.black24m
                                          : KioskTextTheme.white24b,
                                      maxLines: 5,
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                ],
                              ),
                            ),
                            const Icon(Icons.cancel, size: 40),
                            const SizedBox(width: 14),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              KioskBottomButtonWidget(
                  firstText: '이전',
                  secondText: surveyProgressData.curStep == 3 &&
                          surveyProgressData.curQuestion ==
                              (surveyProgressData
                                      .isClicked['$questionCode'].length -
                                  1)
                      ? '결과보기'
                      : '다음',
                  firstOnPressed: !(surveyProgressData.curStep == 0 &&
                          surveyProgressData.curQuestion == 0)
                      ? () {
                          surveyProgressData.curQuestion == 0
                              ? surveyState.decreaseStep(questionCode)
                              : surveyState.decreaseQuestion();
                        }
                      : null,
                  secondOnPressed: () async {
                    // 현재 질문에 답변 했는지 체크
                    if (!(surveyProgressData.isClicked['$questionCode']
                            [surveyProgressData.curQuestion] ==
                        0)) {
                      // 다음 질문
                      if (index < questions['$questionCode'].length - 1) {
                        surveyState.increaseQuestion();
                      }
                      // 스텝의 마지막 질문인 경우
                      else {
                        // 데이터 업데이트
                        data['isClicked']['$questionCode'] =
                            surveyProgressData.isClicked['$questionCode'];
                        // 다음 스텝
                        if (surveyProgressData.curStep < 3) {
                          surveyState.increaseStep();
                        } else {
                          // 저장 후 이동
                          final response = await surveyData.postSurveyResult();
                          if (response != null) {
                            if (!mounted) return;
                            context.go('/kiosk-mbti-result?surveyId=$response');
                          }
                        }
                      }
                    } else {
                      toastMessage.topYellowBoxBlueText("답변을 선택해주세요!");
                    }
                  })
            ],
          ),
        );
      },
      loading: () => const LoadingCircleAnimationWidget(),
      error: (e, s) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text('Error: $e'),
        ),
      ),
    );
  }
}
