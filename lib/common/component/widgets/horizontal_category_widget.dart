import 'package:beauty_care/common/model/skincare_category_model.dart';
import 'package:flutter/material.dart';

import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';

// ignore: must_be_immutable
class HorizontalCategoryWidget extends StatelessWidget {
  HorizontalCategoryWidget(
      {Key? key,
      required this.onPressed,
      required this.curIndex,
      required this.categories})
      : super(key: key);

  int curIndex;
  final dynamic onPressed;
  final List<SkincareCategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: index == 0
                  ? const EdgeInsets.fromLTRB(24, 0, 4, 0)
                  : const EdgeInsets.symmetric(horizontal: 4),
              child: ElevatedButton(
                style: index == curIndex
                    ? AppButtonTheme.basicElevatedButtonTheme.copyWith(
                        padding: MaterialStateProperty.resolveWith(
                          (states) {
                            return const EdgeInsets.fromLTRB(6, 0, 6, 0);
                          },
                        ),
                      )
                    : AppButtonTheme.outlinedBasicButtonTheme.copyWith(
                        padding: MaterialStateProperty.resolveWith((states) {
                          return const EdgeInsets.fromLTRB(6, 0, 6, 0);
                        }),
                      ),
                onPressed: () {
                  curIndex = index;
                  onPressed(curIndex);
                },
                child: Text(
                  categories[index].name ?? '-',
                  style: index == curIndex
                      ? AppTextTheme.white12b.copyWith(height: 1.0)
                      : AppTextTheme.blue12b.copyWith(height: 1.0),
                ),
              ),
            );
          }),
    );
  }
}
