import 'package:beauty_care/common/layout/app_text.dart';

import 'package:beauty_care/common/provider/auth_provider.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/common/view/custom_circle_indicator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_banner_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  static String get routeName => 'home';

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void _requestPermission() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final authStateNotifier = ref.watch(authStateProvider.notifier);
    final authState = ref.watch(authStateProvider);
    final user = ref.watch(userNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: const [
            Expanded(
              child: Image(
                image: AssetImage("assets/images/oxygen_logo.png"),
              ),
            )
          ]),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => context.pushNamed('login'),
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () =>
                      authStateNotifier.navigateToPage(context, ref, 'mypage'),
                  icon: const Icon(Icons.person),
                ),
                IconButton(
                  onPressed: () => context.pushNamed('noti'),
                  icon: const Icon(Icons.notifications),
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            /// 로그인 전
            if (authState == false) ...[
              // 피부질환 예측하기
              HomeBannerWidget(
                imgUrl: 'assets/images/main_stack_sample.png',
                title: '나의 피부 질환을\n예측해보세요.',
                markText: '피부 질환',
                caption: '피부에 숨겨진 문제를 찾아,\n맞춤형 시술과 화장품을\n추천해 드립니다.',
                onPressed: () => authStateNotifier.navigateToPage(
                    context, ref, 'predictSkinDisease'),
                type: 'surgery',
              ),
              // 피부MBTI 예측하기
              HomeBannerWidget(
                imgUrl: 'assets/images/main_stack_sample.png',
                title: '나의 피부 MBTI가\n궁금하지 않으세요?',
                markText: '피부 MBTI',
                caption: 'AI로 진단 받아 보시고,\n체계적으로 관리해보세요!',
                onPressed: () => authStateNotifier.navigateToPage(
                    context, ref, 'predictSkinMbti'),
                type: 'mbti',
              ),
            ]

            /// 로그인 후
            else ...[
              // 피부질환 예측하기
              Stack(
                children: [
                  HomeBannerWidget(
                    type: 'surgery',
                    title: '질환 예측 후 5일\n지났습니다.',
                    markText: '질환 예측 후 5일',
                    caption: '3개월 주기 검진 권장',
                    onPressed: () => authStateNotifier.navigateToPage(
                        context, ref, 'predictSkinDisease'),
                    // widget: , todo : 지난 예측 결과 표현
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/main_face_icon_sample.png',
                      opacity: const AlwaysStoppedAnimation(.5),
                    ),
                  ),
                ],
              ),

              // 피부MBTI 예측하기
              HomeBannerWidget(
                type: 'mbti',
                title: '${user.name} 님의 피부 MBTI는?',
                onPressed: () => authStateNotifier.navigateToPage(
                    context, ref, 'predictSkinDisease'),
                widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 8),
                      Text('DRPT', style: AppTextTheme.yellow24b),
                      SizedBox(height: 4),
                      Text(
                        'Oily, Resistant, Non-pigmented, Tight',
                        style: AppTextTheme.white12,
                      ),
                      SizedBox(height: 20),
                      CustomCircleIndicator(
                          categories: ['유분', '색소', '민감'],
                          percents: [0.9, 0.54, 0.34]),
                      SizedBox(height: 16),
                    ]),
              ),
            ]
          ]),
        ));
  }
}
