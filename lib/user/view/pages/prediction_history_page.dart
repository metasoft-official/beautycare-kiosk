import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/user/provider/history_state_provider.dart';
import 'package:beauty_care/user/provider/mypage_page_provider.dart';

import 'package:beauty_care/common/component/widgets/custom_tabbar_widget.dart';
import 'package:beauty_care/common/component/widgets/custom_tabbar_view_widget.dart';
import 'package:beauty_care/user/view/widgets/history_widget.dart';

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
    final mypageState = ref.watch(mypageStateProvider);

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
          widgets: [
            // todo : mbti, 피부질환 이력 데이터에 맞게 전달
            HistoryWidget(
              onTap: () => context.pushNamed('mbtiResult'),
              itemCount: mypageState.histories.length,
              histories: mypageState.histories,
              nullType: 'history',
            ),
            HistoryWidget(
              onTap: () => context.pushNamed('mbtiResult'),
              itemCount: historyState.skinHistories.length,
              histories: historyState.skinHistories,
              nullType: 'history',
            ),
            HistoryWidget(
              onTap: () => context.pushNamed('mbtiResult'),
              itemCount: historyState.mbtiHistories.length,
              histories: historyState.mbtiHistories,
              nullType: 'history',
            ),
          ],
        ));
  }
}
