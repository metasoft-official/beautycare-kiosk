import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final skinHistoryStateProvider =
    ChangeNotifierProvider<SkinHistoryState>((ref) {
  return SkinHistoryState();
});

class SkinHistoryState extends ChangeNotifier {
  int stateIndex = 0;

  List<String> titles = ['피부나이 변화', '피부점수'];
  // List<FlSpot> spots = [(0,), 22, 24];

  void resetState() {
    SkinHistoryState();
    notifyListeners();
  }

  // todo : 기획 정해지면 차트 데이터 수정
  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = '날짜';
              break;
          }

          return Text(text);
        },
      );
}
