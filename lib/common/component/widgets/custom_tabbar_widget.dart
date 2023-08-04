import 'package:flutter/material.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

// 커스텀 탭바 메뉴 부분
class CustomTabbarWidget extends StatelessWidget {
  const CustomTabbarWidget(
      {Key? key, required this.titles, required this.tabController})
      : super(key: key);

  final List<String> titles;
  final TabController tabController;

  ///  사용법 **prediction_history_page.dart 참조
  ///  bottom : PreferredSize 위젯으로 감싸서 읿력

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColor.appColor),
          borderRadius: const BorderRadius.all(Radius.circular(34))),
      child: TabBar(
        indicator: BoxDecoration(
          color: AppColor.whiteBlue,
          border: Border.all(color: Colors.transparent),
          borderRadius: tabController.index == 0
              ? const BorderRadius.only(
                  topLeft: Radius.circular(34), bottomLeft: Radius.circular(34))
              : tabController.index >= 1 &&
                      tabController.length >= 3 &&
                      tabController.index != (tabController.length - 1)
                  ? const BorderRadius.all(Radius.zero)
                  : const BorderRadius.only(
                      topRight: Radius.circular(34),
                      bottomRight: Radius.circular(34),
                    ),
        ),
        tabs: getTabs(titles, tabController),
        controller: tabController,
      ),
    );
  }
}

// Tab 바 타이틀
List<Widget> getTabs(List<String> titles, TabController tabController) {
  List<Widget> widgets = [];
  for (int i = 0; i < titles.length; i++) {
    widgets.add(Padding(
      padding: const EdgeInsets.all(9),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(titles[i],
            style: tabController.index == i
                ? AppTextTheme.blue14b
                : AppTextTheme.blue14m),
      ),
    ));
  }

  return widgets;
}
