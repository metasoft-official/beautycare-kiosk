import 'dart:ui';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class GradientBarChartWidget extends StatelessWidget {
  final double? percent;
  final Color? backgourndColor;
  final double? width;
  const GradientBarChartWidget(
      {super.key, this.percent, this.backgourndColor, this.width});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: 1,
        child: Container(
          margin: const EdgeInsets.fromLTRB(8, 0, 4, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          height: width,
          width: 16,
          child: BarChart(
            BarChartData(
              gridData: FlGridData(
                show: false,
              ),
              backgroundColor: backgourndColor ?? AppColor.lightGrey,
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              maxY: 100,
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                        gradient: const LinearGradient(
                            colors: [
                              AppColor.appColor,
                              AppColor.purple,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        width: 16,
                        toY: percent!),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
