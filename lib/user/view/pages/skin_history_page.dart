import 'package:beauty_care/user/provider/wish_list_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/user/provider/skin_history_state_provider.dart';
import 'package:beauty_care/common/component/widgets/custom_tabbar_widget.dart';
import 'package:beauty_care/common/component/widgets/custom_tabbar_view_widget.dart';
import 'package:beauty_care/user/view/widgets/history_widget.dart';

class SkinHistoryPage extends ConsumerStatefulWidget {
  const SkinHistoryPage({Key? key}) : super(key: key);

  static String get routeName => 'skinHistory';

  @override
  SkinHistoryState createState() => SkinHistoryState();
}

class SkinHistoryState extends ConsumerState<SkinHistoryPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      final wishlistState = ref.watch(wishListStateProvider);
      wishlistState.stateIndex = tabController.index;
      wishlistState.resetState();
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final skinHistoryState = ref.watch(skinHistoryStateProvider);

    return Scaffold(
      appBar: AppBar(
          title: const Text('피부 변화 그래프'),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: CustomTabbarWidget(
                  titles: skinHistoryState.titles,
                  tabController: tabController))),
      body: CustomTabbarViewWidget(
        tabController: tabController,
        widgets: const [
          // todo : 위시리스트 entity 전달
          HistoryWidget(
            itemCount: 0,
            nullMessage: '피부 변화 기록이 없어요!',
          ),
          HistoryWidget(
            itemCount: 0,
            nullMessage: '피부 변화 기록이 없어요!',
          ),
        ],
      ),
    );
  }
}
