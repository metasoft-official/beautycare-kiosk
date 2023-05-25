import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:beauty_care/common/provider/auth_provider.dart';

import '../../user/view/login_page.dart';
import '../view/home_page.dart';

// 로그인 상태를 제공하는 Provider
final authStateProvider = StateNotifierProvider<AuthStateNotifier, bool>(
    (ref) => AuthStateNotifier());

// 로그인 상태에 따라 라우트를 업데이트하는 RouterDelegate
class AuthRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<String> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final WidgetRef ref;

  AuthRouterDelegate({required this.ref});

  @override
  Future<void> setNewRoutePath(String configuration) async {}

  @override
  String? get currentConfiguration {
    final isUserLoggedIn = ref.watch(authStateProvider);
    return isUserLoggedIn ? '/home' : '/login';
  }

  @override
  Widget build(BuildContext context) {
    final isUserLoggedIn = ref.watch(authStateProvider);

    return Navigator(
      key: navigatorKey,
      pages: [
        if (isUserLoggedIn)
          MaterialPage(child: HomePage())
        else
          const MaterialPage(child: LoginPage())
      ],
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }
}
