import 'package:beauty_care/common/component/widgets/product_sliver_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/provider/home_state_provider.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/cosmetic/provider/product_state_provider.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

import 'package:beauty_care/common/component/widgets/list_title_widget.dart';
import 'package:beauty_care/common/component/widgets/product_grid_widget.dart';
import 'package:beauty_care/common/component/widgets/product_list_widget.dart';

class CosmeticProductAll extends ConsumerWidget {
  const CosmeticProductAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productStateProvider);
    final user = ref.watch(userNotifierProvider);
    final homeState = ref.watch(homeStateProvider);

    return SliverToBoxAdapter(
        child: Column(
      children: [],
    ));
  }
}
