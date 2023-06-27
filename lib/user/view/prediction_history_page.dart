import 'package:beauty_care/common/component/widgets/custom_tabbar_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/component/widgets/custom_tabbar_widget.dart';
import 'package:beauty_care/user/provider/history_state_provider.dart';
import 'history_widget.dart';

class PredictionHistoryPage extends ConsumerStatefulWidget {
  const PredictionHistoryPage({Key? key}) : super(key: key);

  static String get routeName => 'history';

  @override
  PredictionHistoryState createState() => PredictionHistoryState();
}

class PredictionHistoryState extends ConsumerState<PredictionHistoryPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      final historyState = ref.watch(historyStateProvider);
      historyState.stateIndex = tabController.index;
      historyState.resetState();
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final historyState = ref.watch(historyStateProvider);

    return Scaffold(
        appBar: AppBar(
            title: const Text('예측 이력'),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: CustomTabbarWidget(
                    titles: historyState.titles,
                    tabController: tabController))),

        // 탭 내용
        body: CustomTabbarViewWidget(
          tabController: tabController,
          widgets: const [
            // todo : mbti, 피부질환 이력 데이터에 맞게 전달
            HistoryWidget(
              itemCount: 0,
              nullMessage: '예측 이력이 없어요!',
              buttonText: '검사하러 가기',
              routerName: 'predict-skin-mbti',
            ),
            HistoryWidget(
              itemCount: 0,
              nullMessage: '예측 이력이 없어요!',
              buttonText: '피부질환 검사하기',
              routerName: 'predict-skin-disease',
            ),
            HistoryWidget(
              itemCount: 10,
              nullMessage: '예측 이력이 없어요!',
              buttonText: 'mbti 검사하기',
              routerName: 'predict-skin-mbti',
            ),
          ],
        ));
  }
}
