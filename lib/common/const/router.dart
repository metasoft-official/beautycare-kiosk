import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod_project/common/layout/home_page.dart';
import 'package:riverpod_project/common/layout/login_page.dart';
import 'package:riverpod_project/common/layout/sign_up_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/sign-in',
      name: SignInPage.routeName,
      builder: (context, state) => SignInPage(),
    ),
    GoRoute(
      path: '/sign-up',
      name: SignUpPage.routeName,
      builder: (context, state) => const SignUpPage(),
      // routes : [
      //   GoRoute(
      //     name: 'signUpDetail',
      //     path: 'sign-up-detail',
      //     builder: (context, state) => SignUpDetailPage(),
      //   ),
      // ],
    ),
  ],
);
