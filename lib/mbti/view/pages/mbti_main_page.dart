import 'package:beauty_care/main.dart';
import 'package:flutter/material.dart';
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
    final surveyData = ref.watch(surveyProgressStateProvider);
    final surveyState = ref.watch(surveyProgressStateProvider.notifier);

    List<SurveyQuestionModel> questions = [];

    return asyncValue.when(
      data: (data) {
        questions = data;
        logger.d(data);

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
                      icons: surveyData.icons,
                      width: MediaQuery.of(context).size.width,
                      color: AppColor.appColor,
                      curStep: surveyData.curStep,
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(24, 36, 24, 0),
                  child: Column(
                    children: const [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'STEP 1. 유수분 밸런스',
                          style: AppTextTheme.blue20b,
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
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
                questions: questions,
              ),

              //버튼
              if (surveyData.curStep > 0) ...[
                SliverToBoxAdapter(
                  child: InkWell(
                    onTap: () {
                      surveyState.decreaseStep();
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 30),
                        height: 60,
                        width: double.infinity,
                        color: Colors.white,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "이전 단계",
                            style: AppTextTheme.blue14b,
                          ),
                        )),
                  ),
                ),
              ]
            ],
          ),
          bottomNavigationBar: ButtonBottomNavigationBarWidget(
            buttonColor: AppColor.appColor,
            textStyle: AppTextTheme.white14b,
            label: surveyData.curStep == 3 ? '결과 확인하기' : '다음 단계',
            onPressed: () {
              surveyData.curStep < 3
                  ? surveyState.increaseStep()
                  : context.pushNamed('mbtiResult');
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
