import 'package:go_router/go_router.dart';

import 'package:riverpod_project/common/view/home_page.dart';
import 'package:riverpod_project/user/view/login_page.dart';
import 'package:riverpod_project/common/view/register_page.dart';
import 'package:riverpod_project/common/view/predict_skin_disease_page.dart';
import 'package:riverpod_project/common/view/predict_skin_mbti_page.dart';
import 'package:riverpod_project/mbti/view/survey_page.dart';
import 'package:riverpod_project/common/component/widgets/camera_capture_widget.dart';
import 'package:riverpod_project/user/view/find_id_page.dart';

import '../../user/view/mypage_page.dart';

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
  ],
);
