import 'package:beauty_care/user/provider/wish_list_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/component/widgets/custom_tabbar_widget.dart';
import 'package:beauty_care/common/component/widgets/custom_tabbar_view_widget.dart';
import 'package:beauty_care/user/view/widgets/history_widget.dart';

class WishListPage extends ConsumerStatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  static String get routeName => 'wishlist';

  @override
  WishListState createState() => WishListState();
}

class WishListState extends ConsumerState<WishListPage>
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
    final wishlistState = ref.watch(wishListStateProvider);

    return Scaffold(
      appBar: AppBar(
          title: const Text('위시리스트'),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: CustomTabbarWidget(
                  titles: wishlistState.titles, tabController: tabController))),
      body: CustomTabbarViewWidget(
        tabController: tabController,
        widgets: const [
          // todo : 위시리스트 entity 전달
          HistoryWidget(
            itemCount: 0,
            nullType: 'wishList',
          ),
          HistoryWidget(
            itemCount: 0,
            nullType: 'wishList',
          ),
        ],
      ),
    );
  }
}
