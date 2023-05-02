import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:go_router/go_router.dart';

import 'package:riverpod_project/ui/home_page.dart';
import 'package:riverpod_project/ui/sign_up_page.dart';
import 'package:riverpod_project/ui/sign_in_page.dart';

import 'todo.dart';

void main() {
  runApp(ProviderScope(
      child: MyApp()
  ));
}


final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),

    GoRoute(
      path: '/sign-up',
      builder: (context, state) => SignUpPage(),
      routes: [
        GoRoute(
          path : 'studentA',
          builder: (context, state) => StudentA(),
        ),
      ],
    ),

    GoRoute(
      name : 'classB',
      path: '/classB',
      builder: (context, state) => SignInPage(),
      routes : [
        GoRoute(
          name: 'studentB',
          path: 'studentB',
          builder: (context, state) => StudentB(),

        ),
      ],
    ),
  ],
);



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData.dark().copyWith(
        // scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Go router',
    );
  }
}
