import 'package:beauty_care/disease/model/disease_model.dart';
import 'package:beauty_care/kiosk/view/pages/kiosk_disease_result_page.dart';
import 'package:beauty_care/kiosk/view/pages/kiosk_mbti_result_page.dart';
import 'package:beauty_care/kiosk/view/pages/kiosk_mbti_survey_page.dart';
import 'package:beauty_care/kiosk/view/pages/kiosk_select_disease_page.dart';
import 'package:beauty_care/kiosk/view/pages/kiosk_shooting_page.dart';
import 'package:beauty_care/kiosk/view/pages/kiosk_pre_check_page.dart';
import 'package:beauty_care/promotion/view/pages/promotion_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:beauty_care/cosmetic/view/pages/cosmetic_product_page.dart';

import 'package:beauty_care/oxyfacial/view/pages/oxy_facial_main_page.dart';

import 'package:beauty_care/kiosk/view/pages/kiosk_home_page.dart';
import 'package:beauty_care/kiosk/view/pages/kiosk_main_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

// if()

class AppRouter {
  static GoRouter getRouter(bool isKioskMode) {
    final initialLocation = '/kiosk-main';

    final router = GoRouter(
      initialLocation: initialLocation,
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          path: '/kiosk-main',
          name: KioskMainPage.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: KioskMainPage(),
          ),
        ),
        GoRoute(
          path: '/kiosk-home',
          name: KioskHomePage.routeName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: KioskHomePage(),
          ),
        ),
        GoRoute(
          path: '/kiosk-pre-check',
          name: KioskPreCheckPage.routeName,
          pageBuilder: (context, state) => MaterialPage(
            // You might need to use a suitable subclass of Page here
            child: KioskPreCheckPage(
              type: state.queryParameters['type'],
            ),
          ),
        ),
        GoRoute(
          path: '/kiosk-shooting',
          name: KioskShootingPage.routeName,
          pageBuilder: (context, state) => MaterialPage(
            // You might need to use a suitable subclass of Page here
            child: KioskShootingPage(
              type: state.queryParameters['type'],
            ),
          ),
        ),
        GoRoute(
          path: '/kiosk-disease',
          name: KioskSelectDiseasePage.routeName,
          builder: (context, state) {
            DiseaseModel diseaseModel = state.extra as DiseaseModel;
            return KioskSelectDiseasePage(disease: diseaseModel);
          },
        ),

        // mbti
        GoRoute(
          path: '/kiosk-survey',
          name: KioskMbtiSurveyPage.routeName,
          builder: (context, state) => const KioskMbtiSurveyPage(),
        ),
        GoRoute(
          path: '/kiosk-mbti-result',
          name: KioskMbtiResultPage.routeName,
          builder: (context, state) => KioskMbtiResultPage(
            surveyId: state.queryParameters['surveyId'],
          ),
        ),

        //로그인
        GoRoute(
          path: '/kiosk-disease-result',
          name: KioskDiseaseResultPage.routeName,
          builder: (context, state) => KioskDiseaseResultPage(
            diseaseId: state.queryParameters['diseaseId'],
          ),
        ),
        GoRoute(
          path: '/cosmetic-product',
          name: CosmeticProductPage.routeName,
          builder: (context, state) => const CosmeticProductPage(),
        ),

        // oxyfacial
        GoRoute(
          path: '/oxy-facial',
          name: OxyFacialMainPage.routeName,
          builder: (context, state) => const OxyFacialMainPage(),
        ),
        // promotion
        GoRoute(
          path: '/promotion',
          name: PromotionMainPage.routeName,
          builder: (context, state) => const PromotionMainPage(),
        ),
      ],
    );
    return router;
  }
}
