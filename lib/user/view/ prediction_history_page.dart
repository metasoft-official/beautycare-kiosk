import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'history_widget.dart';

class PredictionHistoryPage extends ConsumerStatefulWidget {
  const PredictionHistoryPage({Key? key}) : super(key: key);

  static String get routeName => 'history';

  @override
  PredictionHistoryState createState() => PredictionHistoryState();
}

class PredictionHistoryState extends ConsumerState<PredictionHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('예측 이력')),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: CustomScrollView(slivers: [
          HistoryWidget(
            childCount: 15,
            // todo 기존 이력 데이터 리스트로 연결
          )
        ]),
      ),
    );
  }
}
