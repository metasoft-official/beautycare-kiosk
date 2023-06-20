import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/layout/app_color.dart';
import 'history_widget.dart';

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
      // Do something when tab is switched
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('찜 목록'),
        bottom: TabBar(
          tabs: [
            Container(
              margin: const EdgeInsets.all(8),
              child: const Text('화장품',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: const Text('클리닉',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            )
          ],
          labelColor: AppColor.appColor,
          indicatorColor: AppColor.appColor,
          controller: tabController,
          unselectedLabelColor: AppColor.grey,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        height: MediaQuery.of(context).size.height,
        child: TabBarView(
          controller: tabController,
          children: const [
            // todo : mbti, 피부질환 이력 데이터에 맞게 전달
            HistoryWidget(
              itemCount: 0,
              nullMessage: '찜한 내역이 없어요!',
              buttonText: '화장품 보러가기',
              routerName: 'predict-skin-mbti',
            ),
            HistoryWidget(
              itemCount: 0,
              nullMessage: '찜한 내역이 없어요!',
              buttonText: '클리닉 보러가기',
              routerName: 'predict-skin-disease',
            ),
          ],
        ),
      ),
    );
  }
}
