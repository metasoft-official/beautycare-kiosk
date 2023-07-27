import 'package:beauty_care/common/component/widgets/horizontal_category_widget.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/provider/home_state_provider.dart';
import 'package:beauty_care/cosmetic/provider/product_state_provider.dart';

class CosmeticProductOrder extends ConsumerWidget {
  const CosmeticProductOrder({
    Key? key,
    required this.selectedValue,
    this.onTap,
    this.textStyle,
    this.iconSize,
    required this.orderCategories,
  }) : super(key: key);

  // filter
  final List<String> orderCategories;
  final String selectedValue;
  final dynamic onTap;

  // filter style
  final TextStyle? textStyle;
  final double? iconSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Text(
                    selectedValue,
                    style:
                        textStyle ?? AppTextTheme.blue16b.copyWith(height: 1.2),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: iconSize ?? 20,
                    color: AppColor.appColor,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
