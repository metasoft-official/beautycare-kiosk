import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:go_router/go_router.dart';

import 'package:beauty_care/common/const/router.dart';
import 'package:beauty_care/user/view/login_page.dart';

import 'common/layout/app_theme.dart';
import 'common/provider/auth_provider.dart';
import 'common/view/home_page.dart';
import 'common/const/auth_router_delegate.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
