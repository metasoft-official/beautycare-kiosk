import 'package:go_router/go_router.dart';

import 'package:riverpod_project/common/view/home_page.dart';
import 'package:riverpod_project/common/view/login_page.dart';
import 'package:riverpod_project/common/view/register_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/login',
      name: LoginPage.routeName,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: RegisterPage.routeName,
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);
