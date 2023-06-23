import 'package:beauty_care/common/component/widgets/custom_app_bar.dart';
import 'package:beauty_care/common/layout/app_text.dart';

import 'package:beauty_care/common/provider/auth_provider.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/common/component/widgets/custom_circle_indicator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../component/widgets/list_title_widget.dart';
import '../layout/app_color.dart';
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
      body: CustomScrollView(
        slivers: [
          // 앱바
          const CustomAppBar(),
          // 콘텐츠
          SliverToBoxAdapter(
            child: Column(children: [
              // 메인 배너 =======================================================
              // 로그인 전
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

              // 로그인 후
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
              ],

              // 피부 타입 별 랭킹 ==================================================
              ListTitleWidget(
                text: authState == false ? '피부 타입 별 랭킹' : '건선인 나를 위한 추천',
                markText: authState == false ? '피부 타입 별' : '건선',
                onTap: () => context.pushNamed('cosmeticProduct'),
              ),

              // 화장품 추천 ==================================================
              ListTitleWidget(
                text: authState == false
                    ? '제품 라인 별 랭킹'
                    : '${user.name} 님 취향저격 화장품',
                markText: authState == false ? '제품 라인 별' : '${user.name}',
                onTap: () => context.pushNamed('cosmeticProduct'),
              )
            ]),
          )
        ],
      ),
    );
  }
}
