import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/mbti/model/survey_question_model.dart';
import 'package:beauty_care/mbti/provider/survey_state_provider.dart';

import 'package:beauty_care/common/component/widgets/icon_stepper_widget.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/mixins/hide_navigation_bar_mixin.dart';
import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/mbti/view/widgets/survey_widget.dart';

import '../../../main.dart';

class MbtiMainPage extends ConsumerStatefulWidget {
  const MbtiMainPage({super.key});

  static String get routeName => 'survey';

  @override
  MbtiMainState createState() => MbtiMainState();
}

class MbtiMainState extends ConsumerState<MbtiMainPage> {
  final HideNavbar mbtiHiding = HideNavbar();

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(surveyStateProvider);
    final surveyData = ref.watch(surveyStateProvider.notifier);

    return asyncValue.when(
      data: (data) {
        final surveyState =
            ref.watch(surveyProgressStateProvider(data['isClicked']).notifier);
        final surveyProgressData =
            ref.watch(surveyProgressStateProvider(data['isClicked']));

        return Scaffold(
          appBar: AppBar(
            title: const Text('MBTI'),
            leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back_outlined)),
          ),
          backgroundColor: AppColor.lightGrey,
          body: CustomScrollView(
            controller: mbtiHiding.controller,
            slivers: [
              // 문진 카테고리
              SliverPersistentHeader(
                floating: false,
                pinned: true,
                delegate: PersistentHeader(
                  maxExtent: 140,
                  minExtent: 140,
                  widget: Container(
                    color: Colors.white,
                    child: IconStepperWidget(
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      color: AppColor.appColor,
                      curStep: surveyProgressData.curStep,
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(24, 36, 24, 0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'STEP ${surveyProgressData.curStep + 1}. ${surveyData.categoryName[surveyProgressData.curStep]}',
                          style: AppTextTheme.blue20b,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          '피부의 상태를 더욱 자세히 파악하기 위한 질문입니다.',
                          style: AppTextTheme.middleGrey12m,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //문진 내용
              SurveyWidget(
                  questionList: data['questions'],
                  isClicked: data['isClicked'],
                  questionCode: surveyProgressData.curStep + 6),
            ],
          ),
          bottomNavigationBar: ButtonBottomNavigationBarWidget(
            buttonColor: AppColor.appColor,
            textStyle: AppTextTheme.white14b,
            label: surveyProgressData.curStep == 3 ? '결과 확인하기' : '다음 단계',
            onPressed: () async {
              // 모두 답변 되었는지 확인
              if (surveyProgressData
                      .isClicked['${surveyProgressData.curStep + 6}']
                      .contains(0) ==
                  false) {
                // 데이터 업데이트
                data['isClicked']['${surveyProgressData.curStep + 6}'] =
                    surveyProgressData
                        .isClicked['${surveyProgressData.curStep + 6}'];
                // 다음 단계 또는 저장 후 이동
                if (surveyProgressData.curStep < 3) {
                  setState(() {
                    mbtiHiding.controller.animateTo(
                      0.0,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                    logger.d(mbtiHiding.controller);
                  });
                  surveyState.increaseStep();
                } else {
                  final response = await surveyData.postSurveyResult();
                  if (response != null) {
                    if (!mounted) return;
                    context.go('/mbti-result?surveyId=$response');
                  }
                }
                // 모두 답변되지 않았을 때 경고
              } else {
                toastMessage.topYellowBoxBlueText("모든 질문의 답변을 선택해주세요!");
              }
            },
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
