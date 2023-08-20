import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:beauty_care/common/provider/auth_provider.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/common/provider/home/home_state_provider.dart';

import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/view/widgets/home_banner_widget.dart';
import 'package:beauty_care/common/component/widgets/horizontal_category_widget.dart';
import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/common/component/widgets/custom_app_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_carousel_slider.dart';
import 'package:beauty_care/common/component/widgets/list_title_widget.dart';
import 'package:beauty_care/common/component/widgets/product_list_widget.dart';
import 'package:beauty_care/common/component/mixins/hide_navigation_bar_mixin.dart';

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

  HideNavbar mainHiding = HideNavbar();

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(homeDataStateProvider);
    final homeDataState = ref.watch(homeDataStateProvider.notifier);
    final authStateNotifier = ref.watch(authStateProvider.notifier);
    final authState = ref.watch(authStateProvider);
    final user = ref.watch(userNotifierProvider);

    return asyncValue.when(
      data: (data) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: CustomBottomNavigationBar(
              child: CustomScrollView(
                controller: mainHiding.controller,
                slivers: [
                  // 앱바
                  const CustomAppBar(),
                  // 콘텐츠
                  SliverToBoxAdapter(
                    child: Column(children: [
                      // 메인 배너 =======================================================
                      // 로그인 전
                      // todo 검사를 안 했을 때도 해당
                      if (authState == false) ...[
                        // 피부질환 예측하기
                        HomeBannerWidget(
                          imgUrl: 'assets/images/main_stack_01.png',
                          title: '나의 피부 질환을\n예측해보세요.',
                          markText: '피부 질환',
                          caption: '피부에 숨겨진 문제를 찾아,\n맞춤형 시술과 화장품을\n추천해 드립니다.',
                          onPressed: () => authStateNotifier.navigateToPage(
                              context, ref, 'predictSkinDisease'),
                          type: 'surgery',
                        ),
                        // 피부MBTI 예측하기
                        HomeBannerWidget(
                          bottom: -30,
                          imgUrl: 'assets/images/main_stack_02.png',
                          title: '나의 피부 MBTI가\n궁금하지 않으세요?',
                          markText: '피부 MBTI',
                          caption: 'AI로 진단 받아 보시고,\n체계적으로 관리해보세요!',
                          onPressed: () => authStateNotifier.navigateToPage(
                              context, ref, 'survey'),
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
                              top: -30,
                              right: -90,
                              child: Image.asset(
                                'assets/images/main_stack_03.png',
                                opacity: const AlwaysStoppedAnimation(.5),
                                width: 350,
                              ),
                            ),
                          ],
                        ),

                        // 피부MBTI 예측하기
                        HomeBannerWidget(
                          type: 'mbti',
                          title: '${user.name} 님의 피부 MBTI는?',
                          onPressed: () => authStateNotifier.navigateToPage(
                              context, ref, 'survey'),
                          widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                const Text('DRPT',
                                    style: AppTextTheme.yellow24b),
                                const SizedBox(height: 4),
                                const Text(
                                  'Oily, Resistant, Non-pigmented, Tight',
                                  style: AppTextTheme.white12,
                                ),
                                const SizedBox(height: 20),
                                const Text('피부 고민 키워드',
                                    style: AppTextTheme.white14b),
                                const SizedBox(height: 10),
                                GridView.builder(
                                    padding: const EdgeInsets.all(0),
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: homeDataState.keywords.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: (index + 1) % 3 == 0
                                            ? const EdgeInsets.fromLTRB(
                                                0, 0, 0, 8)
                                            : const EdgeInsets.fromLTRB(
                                                0, 0, 8, 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(35)),
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '#${homeDataState.keywords[index]}',
                                            style: AppTextTheme.white14b,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                    },
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 2.5 / 1,
                                            crossAxisCount: 3)),
                                const SizedBox(height: 10),
                              ]),
                        ),
                      ],

                      // 피부 타입 별 랭킹 ==================================================
                      ListTitleWidget(
                          text: '피부 타입 별 랭킹',
                          markText: '피부 타입 별',
                          onTap: () => {
                                authStateNotifier.navigateToPage(
                                    context, ref, 'cosmeticProduct'),
                              }),
                      // 피부 타입 별 카테고리
                      HorizontalCategoryWidget(
                        // onPressed: homeState.setBannerIndex,
                        onPressed: (index) {
                          homeDataState.bannerCurIndex = index;
                          homeDataState.mainTypeCurIndex = index;
                          homeDataState.moveSlidePage(index);
                        },
                        curIndex: homeDataState.bannerCurIndex,
                        categories: data['typeCategory'],
                      ),
                      const SizedBox(height: 12),
                      // 슬라이더
                      CustomCarouselSlider(
                        curIndex: homeDataState.bannerCurIndex,
                        imageList: homeDataState.images,
                        titles: data['typeCategory'],
                        captions: homeDataState.typeCaptions,
                        onPageChanged: (index, reason) {
                          homeDataState.bannerCurIndex = index;
                          homeDataState.getTypeProductList();
                        },
                        controller: homeDataState.crouselController,
                      ),
                      const SizedBox(height: 12),
                      if (data['homeLankType'] != null &&
                          data['homeLankType'].length != 0) ...[
                        ProductListWidget(
                            products: data['homeLankType'],
                            lankVisible: false,
                            btnVisible: false,
                            imgVisible: false,
                            itemCount: 2,
                            categoryName: data['typeCategory']
                                    [homeDataState.mainTypeCurIndex]
                                .name)
                      ],

                      // 화장품 추천 ==================================================
                      ListTitleWidget(
                        text: '제품 라인 별 랭킹',
                        markText: '제품 라인 별',
                        onTap: () => context.pushNamed('cosmeticProduct'),
                      ),
                      // todo 카테고리 데이터 연동 적용
                      // 제품 라인 별 카테고리
                      HorizontalCategoryWidget(
                        onPressed: (index) {
                          homeDataState.mainLineCurIndex = index;
                          homeDataState.getLineProductList();
                        },
                        curIndex: homeDataState.mainLineCurIndex,
                        categories: data['lineCategory'],
                      ),
                      const SizedBox(height: 12),
                      if (data['homeLankLine'] != null &&
                          data['homeLankLine'].length != 0) ...[
                        ProductListWidget(
                            products: data['homeLankLine'],
                            lankVisible: true,
                            btnVisible: true,
                            btnText: "인기상품 전체보기",
                            markText: '인기상품',
                            imgVisible: false,
                            categoryName: data['lineCategory']
                                    [homeDataState.mainLineCurIndex]
                                .name)
                      ],
                      const SizedBox(height: 28)
                    ]),
                  ),
                ],
              ),
            ));
      },
      loading: () => const LoadingCircleAnimationWidget(),
      error: (e, s) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text('Error: $e, $s'),
        ),
      ),
    );
  }
}
