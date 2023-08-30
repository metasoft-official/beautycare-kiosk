import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:flutter/material.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

class IconStepperWidget extends StatelessWidget {
  const IconStepperWidget(
      {Key? key,
      required double width,
      required Color color,
      required int curStep,
      required int length,
      List<String>? titles,
      this.isKiosk})
      : _width = width,
        _activeColor = color,
        _titles = titles,
        _curStep = curStep,
        _length = length,
        assert(width > 0),
        super(key: key);

  final bool? isKiosk;
  final double _width;
  final List<String>? _titles;
  final int _curStep;
  final int _length;
  final Color _activeColor;
  final Color _inactiveCircleColor = Colors.white;
  final Color _inactiveLineColor = AppColor.lightGrey;
  final Color _inactiveTextColor = AppColor.grey;
  final double lineWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: isKiosk == true
            ? const EdgeInsets.fromLTRB(0, 10, 0, 0)
            : const EdgeInsets.fromLTRB(24, 40, 24, 36),
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
    for (int i = 0; i < _length; i++) {
      //상태에 따른 각 색상
      var circleColor =
          (i == 0 || _curStep >= i) ? _activeColor : _inactiveCircleColor;

      var lineColor = _curStep >= i
          ? _activeColor
          : (isKiosk == true ? Colors.white : _inactiveLineColor);

      list.add(
        Container(
          width: isKiosk == true ? 120 : 54,
          height: isKiosk == true ? 120 : 54,
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
                      ? (isKiosk == true
                          ? KioskTextTheme.white18
                          : AppTextTheme.white10)
                      : (isKiosk == true
                          ? KioskTextTheme.middleGrey16
                          : AppTextTheme.grey10),
                ),
                Text(
                  '${i + 1}',
                  style: (i == 0 || _curStep >= i)
                      ? (isKiosk == true
                          ? KioskTextTheme.white28b
                          : AppTextTheme.white20b)
                      : (isKiosk == true
                          ? KioskTextTheme.middleGrey24b
                          : AppTextTheme.grey20b),
                )
              ],
            ),
          ),
        ),
      );

      //진행 바
      if (i != _length - 1) {
        list.add(Expanded(
            child: Container(
          height: isKiosk == true ? 6 : lineWidth,
          color: lineColor,
        )));
      }
    }

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
