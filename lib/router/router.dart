import 'package:riverpod_project/main.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_project/router/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final _key = GlobalKey<NavigatorState>(debugLabel:'routerKey');

// final routerProvider = Provider.autoDispose<GoRouter>((ref) {
//   final notifier = ref.watch(routerNotifierProvider.notifier);
//
//   return GoRouter(
//     navigatorKey: _key,
//     refreshListenable: notifier,
//
//   );
// });

