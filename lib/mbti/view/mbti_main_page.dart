import 'package:beauty_care/mbti/view/survey_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/component/widgets/icon_stepper.dart';
import '../../common/layout/app_button_theme.dart';
import '../../common/layout/app_color.dart';

class MbtiMainPage extends ConsumerStatefulWidget {
  const MbtiMainPage({super.key});

  static String get routeName => 'survey';

  @override
  MbtiMainState createState() => MbtiMainState();
}

class MbtiMainState extends ConsumerState<MbtiMainPage> {
  ///상태 관리 필요
  final curStep = 2;
  final titles = ['수분', '민감', '색소', '주름', '추가'];
  final icons = [
    Icons.water_drop,
    Icons.warning,
    Icons.colorize,
    Icons.waves,
    Icons.plus_one
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('MBTI')),
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
                    icons: icons,
                    width: MediaQuery.of(context).size.width,
                    color: AppColor.appColor,
                    curStep: curStep,
                    titles: titles,
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
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed('mbtiResult');
                  },
                  style: AppButtonTheme.roundedElevatedButtonTheme,
                  child: const Text("다음"),
                ),
              ),
            )
          ],
        ));
  }
}
