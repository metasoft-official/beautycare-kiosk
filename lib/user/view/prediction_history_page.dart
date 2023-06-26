import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/layout/app_color.dart';
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
        title: const Text('예측 이력'),
        bottom: TabBar(
          tabs: [
            Container(
              margin: const EdgeInsets.all(8),
              child: const Text('피부 MBTI',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: const Text('피부 질환',
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
              itemCount: 10,
              nullMessage: '예측 이력이 없어요!',
              buttonText: 'mbti 검사하기',
              routerName: 'predict-skin-mbti',
            ),
            HistoryWidget(
              itemCount: 0,
              nullMessage: '예측 이력이 없어요!',
              buttonText: '피부질환 검사하기',
              routerName: 'predict-skin-disease',
            ),
          ],
        ),
      ),
    );
  }
}
