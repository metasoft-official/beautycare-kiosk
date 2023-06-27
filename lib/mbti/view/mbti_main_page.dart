import 'package:beauty_care/mbti/view/survey_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/component/widgets/icon_stepper.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/mbti/provider/quiz_state_provider.dart';

class MbtiMainPage extends ConsumerStatefulWidget {
  const MbtiMainPage({super.key});

  static String get routeName => 'survey';

  @override
  MbtiMainState createState() => MbtiMainState();
}

class MbtiMainState extends ConsumerState<MbtiMainPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final quizState = ref.read(quizStateProvider);
      quizState.resetState();
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(quizStateProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('MBTI'),
          leading: IconButton(
              onPressed: () {
                context.goNamed('home');
              },
              icon: const Icon(Icons.arrow_back_outlined)),
        ),
        body: CustomScrollView(
          slivers: [
            // 문진 카테고리
            SliverPersistentHeader(
              floating: true, // 다시 올리면 보이도록
              delegate: PersistentHeader(
                maxExtent: 160,
                minExtent: 160,
                widget: Container(
                  color: Colors.white,
                  child: IconStepper(
                    icons: quizState.icons,
                    width: MediaQuery.of(context).size.width,
                    color: AppColor.appColor,
                    curStep: quizState.curStep,
                    titles: quizState.titles,
                  ),
                ),
              ),
            ),

            //문진 내용
            const SurveyWidget(),

            //버튼
            SliverToBoxAdapter(
              child: Container(
                // margin: const EdgeInsets.only(top: 22),
                padding: const EdgeInsets.fromLTRB(22, 26, 22, 26),
                // color: Colors.white,
                child: Row(
                  children: [
                    if (quizState.curStep > 0) ...[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            quizState.decreaseStep();
                          },
                          style: AppButtonTheme.outlinedRoundedButtonTheme,
                          child: const Text("이전"),
                        ),
                      ),
                      const SizedBox(width: 8)
                    ],
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          quizState.curStep < 3
                              ? quizState.increaseStep()
                              : context.pushNamed('mbtiResult');
                        },
                        style: AppButtonTheme.roundedElevatedButtonTheme,
                        child: const Text("다음"),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
