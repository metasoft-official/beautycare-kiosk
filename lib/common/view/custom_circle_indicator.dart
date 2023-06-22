import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../layout/app_color.dart';
import '../layout/app_text.dart';

// 원 그래프 위젯
class CustomCircleIndicator extends StatelessWidget {
  const CustomCircleIndicator({
    Key? key,
    required this.categories,
    required this.percents,
  }) : super(key: key);

  final List<double> percents;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    final radius =
        (MediaQuery.of(context).size.width - 88 - 16 * categories.length) /
            categories.length;
    return Row(
      children: [
        for (int i = 0; i < categories.length; i++) ...[
          Column(
            children: [
              Container(
                width: radius,
                height: radius,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(radius))),
                child: CircularPercentIndicator(
                  radius: radius / 2 - 4,
                  lineWidth: 7.0,
                  percent: percents[i],
                  center: percentToText(percents[i]),
                  progressColor: percentToColor(percents[i]),
                  backgroundColor: Colors.white,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                categories[i],
                style: AppTextTheme.white12m,
              )
            ],
          ),
          if (i != categories.length - 1) const Spacer(),
        ]
      ],
    );
  }
}

Widget percentToText(double percent) {
  if (percent <= 0.2) {
    return const Text(
      '낮음',
      style: AppTextTheme.black18b,
    );
  } else if (0.2 < percent && percent <= 0.4) {
    return const Text(
      '조금\n낮음',
      style: AppTextTheme.black16b,
    );
  } else if (0.4 < percent && percent <= 0.6) {
    return const Text(
      '보통',
      style: AppTextTheme.black18b,
    );
  } else if (0.6 < percent && percent <= 0.8) {
    return const Text(
      '조금\n높음',
      style: AppTextTheme.black16b,
    );
  } else {
    return const Text(
      '높음',
      style: AppTextTheme.black18b,
    );
  }
}

Color percentToColor(double percent) {
  if (percent <= 0.2) {
    return AppColor.primary;
  } else if (0.2 < percent && percent <= 0.4) {
    return AppColor.primary;
  } else if (0.4 < percent && percent <= 0.6) {
    return AppColor.semiGrey;
  } else if (0.6 < percent && percent <= 0.8) {
    return AppColor.deepBlue;
  } else {
    return AppColor.deepBlue;
  }
}
