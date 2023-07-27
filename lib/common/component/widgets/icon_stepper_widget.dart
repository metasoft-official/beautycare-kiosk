import 'package:flutter/material.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

class IconStepperWidget extends StatelessWidget {
  const IconStepperWidget(
      {Key? key,
      required List<IconData> icons,
      required double width,
      required Color color,
      required int curStep,
      List<String>? titles})
      : _icons = icons,
        _width = width,
        _activeColor = color,
        _titles = titles,
        _curStep = curStep,
        assert(width > 0),
        super(key: key);

  final double _width;
  final List<IconData> _icons;
  final List<String>? _titles;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveCircleColor = Colors.white;
  final Color _inactiveLineColor = AppColor.lightGrey;
  final Color _inactiveTextColor = AppColor.grey;
  final double lineWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(24, 40, 24, 36),
        width: _width,
        child: Column(
          children: <Widget>[
            Row(
              children: _iconViews(),
            ),
            const SizedBox(height: 10),
            if (_titles != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _titleViews(),
              ),
          ],
        ));
  }

  // 아이콘
  List<Widget> _iconViews() {
    var list = <Widget>[];
    _icons.asMap().forEach((i, icon) {
      //상태에 따른 각 색상
      var circleColor =
          (i == 0 || _curStep >= i) ? _activeColor : _inactiveCircleColor;

      var lineColor = _curStep >= i ? _activeColor : _inactiveLineColor;

      // var iconColor = (i == 0 || _curStep > i)
      //     ? _activeIconColor
      //     : (_curStep == i ? _activeColor : _inactiveColor);

      list.add(
        Container(
          width: 54,
          height: 54,
          padding: const EdgeInsets.all(0),
          decoration: _curStep == i
              ? BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      blurRadius: 6,
                      spreadRadius: 1,
                    )
                  ],
                  border: Border.all(
                    color: _curStep >= i ? _activeColor : _inactiveLineColor,
                    width: 2.0,
                  ),
                )
              : BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _curStep >= i ? _activeColor : _inactiveLineColor,
                    width: 2.0,
                  ),
                ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'STEP',
                  style: (i == 0 || _curStep >= i)
                      ? AppTextTheme.white10
                      : AppTextTheme.grey10,
                ),
                Text(
                  '${i + 1}',
                  style: (i == 0 || _curStep >= i)
                      ? AppTextTheme.white20b
                      : AppTextTheme.grey20b,
                )
              ],
            ),
          ),
        ),
      );

      //진행 바
      if (i != _icons.length - 1) {
        list.add(Expanded(
            child: Container(
          height: lineWidth,
          color: lineColor,
        )));
      }
    });

    return list;
  }

  // 제목
  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titles?.asMap().forEach((i, text) {
      list.add(SizedBox(
          width: 50.0,
          child: Text(
            text,
            style: TextStyle(
                color: (i == 0 || _curStep >= i)
                    ? _activeColor
                    : _inactiveTextColor),
            textAlign: TextAlign.center,
          )));
    });
    return list;
  }
}