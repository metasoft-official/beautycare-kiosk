import 'package:beauty_care/common/component/widgets/custom_bottom_navigation_bar.dart';
import 'package:beauty_care/cosmetic/view/cosmetic_product_page.dart';
import 'package:beauty_care/mbti/view/mbti_result_page.dart';
import 'package:beauty_care/noti/view/noti_main_page.dart';
import 'package:beauty_care/surgery/view/surgery_product_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:beauty_care/common/view/home_page.dart';
import 'package:beauty_care/user/view/login_page.dart';
import 'package:beauty_care/common/view/register_page.dart';
import 'package:beauty_care/common/view/predict_skin_disease_page.dart';
import 'package:beauty_care/common/view/predict_skin_mbti_page.dart';
import 'package:beauty_care/common/component/widgets/camera_capture_widget.dart';
import 'package:beauty_care/user/view/find_id_page.dart';

import '../../mbti/view/mbti_main_page.dart';
import '../../user/view/mypage_page.dart';
import '../../user/view/prediction_history_page.dart';
import '../../user/view/wish_list_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: const CustomBottomNavigationBar(),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            name: HomePage.routeName,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
          ),
          GoRoute(
            path: '/survey',
            name: MbtiMainPage.routeName,
            builder: (context, state) => const MbtiMainPage(),
          ),
        ]),
    GoRoute(
      path: '/login',
      name: LoginPage.routeName,
      builder: (context, state) => LoginPage(
        onLoginSuccess: () {
          return '';
        },
      ),
    ),
    GoRoute(
      path: '/find-id',
      name: FindIdPage.routeName,
      builder: (context, state) => const FindIdPage(),
    ),
    // GoRoute(
    //   path: '/find-password',
    //   name: LoginPage.routeName,
    //   builder: (context, state) => LoginPage(),
    // ),
    GoRoute(
      path: '/register',
      name: RegisterPage.routeName,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/mypage',
      name: MypagePage.routeName,
      builder: (context, state) => const MypagePage(),
    ),
    GoRoute(
      path: '/history',
      name: PredictionHistoryPage.routeName,
      builder: (context, state) => const PredictionHistoryPage(),
    ),
    GoRoute(
      path: '/wish-list',
      name: WishListPage.routeName,
      builder: (context, state) => const WishListPage(),
    ),

    GoRoute(
      path: '/noti',
      name: NotiMainPage.routeName,
      builder: (context, state) => const NotiMainPage(),
    ),

    GoRoute(
      path: '/mbtiResult',
      name: MbtiResultPage.routeName,
      builder: (context, state) => const MbtiResultPage(),
    ),
    GoRoute(
      path: '/predict-skin-mbti',
      name: PredictSkinMbtiPage.routeName,
      builder: (context, state) => PredictSkinMbtiPage(),
    ),
    GoRoute(
      path: '/predict-skin-disease',
      name: PredictSkinDiseasePage.routeName,
      builder: (context, state) => PredictSkinDiseasePage(),
    ),
    GoRoute(
      path: '/camera',
      name: CameraExample.routeName,
      builder: (context, state) => const CameraExample(),
    ),

    // cosmetic
    GoRoute(
      path: '/cosmetic-product',
      name: CosmeticProductPage.routeName,
      builder: (context, state) => const CosmeticProductPage(),
    ),

    // surgery
    GoRoute(
      path: '/surgery-product',
      name: SurgeryProductPage.routeName,
      builder: (context, state) => const SurgeryProductPage(),
    ),
  ],
);
