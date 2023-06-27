import 'package:flutter/material.dart';

// 커스텀 탭바 내용 부분
class CustomTabbarViewWidget extends StatelessWidget {
  CustomTabbarViewWidget(
      {Key? key, required this.tabController, required this.widgets})
      : super(key: key);

  TabController tabController;
  List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: TabBarView(
        controller: tabController,
        children: widgets,
      ),
    );
  }
}
