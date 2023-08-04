import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:beauty_care/cosmetic/view/pages/cosmetic_product_page.dart';
import 'package:beauty_care/surgery/view/pages/surgery_product_page.dart';

import 'package:beauty_care/common/view/pages/home_page.dart';
import 'package:beauty_care/common/view/pages/predict_skin_disease_page.dart';
import 'package:beauty_care/common/view/pages/predict_skin_mbti_page.dart';
import 'package:beauty_care/common/component/widgets/camera_capture_widget.dart';

import 'package:beauty_care/user/view/pages/login_page.dart';
import 'package:beauty_care/user/view/pages/register_page.dart';
import 'package:beauty_care/user/view/pages/find_id_page.dart';
import 'package:beauty_care/user/view/pages/mypage_page.dart';
import 'package:beauty_care/user/view/pages/profile_edit_page.dart';
import 'package:beauty_care/user/view/pages/prediction_history_page.dart';
import 'package:beauty_care/user/view/pages/wish_list_page.dart';
import 'package:beauty_care/user/view/pages/terms_agreement_page.dart';

import 'package:beauty_care/mbti/view/pages/mbti_main_page.dart';
import 'package:beauty_care/mbti/view/pages/mbti_result_page.dart';
import 'package:beauty_care/mbti/view/pages/pre_start_check_page.dart';
import 'package:beauty_care/noti/view/pages/noti_main_page.dart';

import 'package:beauty_care/oxyfacial/view/pages/oxyfacial_main_page.dart';

import 'package:beauty_care/skin/view/pages/skin_result_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: HomePage(),
      ),
    ),
    // ShellRoute(
    //   navigatorKey: _shellNavigatorKey,
    //   builder: (context, state, child) {
    //     print('Current path: ${router.location}'); // 현재 경로를 출력
    //
    //     return Scaffold(
    //       body: child,
    //       bottomNavigationBar: const CustomBottomNavigationBar(),
    //     );
    //   },
    //   routes: [
    GoRoute(
      path: '/main',
      name: HomePage.routeName,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: HomePage(),
      ),
    ),
    //   ],
    // ),
    //     ShellRoute(
    //       navigatorKey: _shellNavigatorKey,
    //       builder: (context, state, child) builder: (context, state, child) {
    //       print('Current path: ${router.location}'); // 현재 경로를 출력
    //
    // return Scaffold(
    // body: child,
    // bottomNavigationBar: const CustomBottomNavigationBar(),
    // );
    // ),

    //로그인
    GoRoute(
      // parentNavigatorKey: _rootNavigatorKey,
      path: '/login',
      name: LoginPage.routeName,
      builder: (context, state) => LoginPage(
        onLoginSuccess: () {
          return '';
        },
      ),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/find-id',
      name: FindIdPage.routeName,
      builder: (context, state) => const FindIdPage(),
    ),
    // GoRoute(
    //   path: '/find-password',
    //   name: LoginPage.routeName,
    //   builder: (context, state) => LoginPage(),
    // ),

    // 회원가입
    GoRoute(
      path: '/terms-agreement',
      name: TermsAgreementPage.routeName,
      builder: (context, state) => const TermsAgreementPage(),
    ),
    GoRoute(
      path: '/register',
      name: RegisterPage.routeName,
      builder: (context, state) => const RegisterPage(),
    ),

    // 마이페이지
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/mypage',
      name: MypagePage.routeName,
      builder: (context, state) => const MypagePage(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/profile-edit',
      name: ProfileEditPage.routeName,
      builder: (context, state) => const ProfileEditPage(),
    ),
    GoRoute(
      path: '/wish-list',
      name: WishListPage.routeName,
      builder: (context, state) => const WishListPage(),
    ),
    GoRoute(
      path: '/prediction-history',
      name: PredictionHistoryPage.routeName,
      builder: (context, state) => const PredictionHistoryPage(),
    ),
    // 알림
    GoRoute(
      path: '/noti',
      name: NotiMainPage.routeName,
      builder: (context, state) => const NotiMainPage(),
    ),

    // mbti
    GoRoute(
      path: '/survey',
      name: MbtiMainPage.routeName,
      builder: (context, state) => const MbtiMainPage(),
    ),
    GoRoute(
      path: '/mbti-result',
      name: MbtiResultPage.routeName,
      builder: (context, state) => const MbtiResultPage(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/mbti-pre-start-check',
      name: MBTIPreStartCheckPage.routeName,
      builder: (context, state) => const MBTIPreStartCheckPage(),
    ),
    GoRoute(
      path: '/predict-skin-mbti',
      name: PredictSkinMbtiPage.routeName,
      builder: (context, state) => PredictSkinMbtiPage(),
    ),

    // 피부질환
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
    GoRoute(
      path: '/skin-result',
      name: SkinResultPage.routeName,
      builder: (context, state) => const SkinResultPage(),
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
    // oxyfacial
    GoRoute(
      path: '/oxyfacial',
      name: OxyfacialMainPage.routeName,
      builder: (context, state) => const OxyfacialMainPage(),
    ),
  ],
);
