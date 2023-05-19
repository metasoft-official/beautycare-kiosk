import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_project/common/component/widgets/icon_stepper.dart';

import '../../common/layout/app_color.dart';
import '../../common/layout/app_text.dart';

class SurveyPage extends ConsumerStatefulWidget {
  const SurveyPage({super.key});

  static String get routeName => 'survey';

  @override
  SurveyState createState() => SurveyState();
}

class SurveyState extends ConsumerState<SurveyPage> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설문'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: IconStepper(
                    icons: const [
                      Icons.water_drop,
                      Icons.warning,
                      Icons.colorize,
                      Icons.waves
                    ],
                    width: MediaQuery.of(context).size.width - 30,
                    color: AppColor.blue,
                    curStep: index,
                    titles: const ['수분', '민감', '색소침착', '주름'],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
