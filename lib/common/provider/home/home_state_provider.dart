import 'package:beauty_care/common/provider/home/state/home_data_state.dart';
import 'package:beauty_care/common/provider/result_data_provider.dart';
import 'package:beauty_care/common/provider/skin_category_provider.dart';
import 'package:beauty_care/common/repository/skin_category_repository.dart';
import 'package:beauty_care/cosmetic/provider/skin_product_provider.dart';
import 'package:beauty_care/cosmetic/repository/skin_product_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:carousel_slider/carousel_controller.dart';

final homeDataStateProvider = AutoDisposeStateNotifierProvider<HomeDataState,
    AsyncValue<Map<String, dynamic>>>((ref) {
  final Map<String, dynamic> resultData =
      ref.watch(resultStateProvider.notifier).data;

  return HomeDataState(ref, ref.read(skinProductRepositoryProvider),
      ref.read(skincareCategoryProvider), resultData);
});
