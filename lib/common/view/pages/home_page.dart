import 'package:beauty_care/clinic/provider/clinic_state_provider.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/provider/result_data_provider.dart';
import 'package:beauty_care/main.dart';
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
import 'package:kakao_flutter_sdk_talk/kakao_flutter_sdk_talk.dart';

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
    ref.read(clinicStateProvider);
    final user = ref.watch(userNotifierProvider);

    return asyncValue.when(
      data: (data) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                CustomBottomNavigationBar(
                  child: CustomScrollView(
                    controller: mainHiding.controller,
                    slivers: [
                      // 앱바
                      const CustomAppBar(),
                      // 콘텐츠
                      SliverToBoxAdapter(
                        child: Consumer(builder: (context, ref, widget) {
                          ref.watch(resultStateProvider);
                          final resultData =
                              ref.watch(resultStateProvider.notifier);

                          return Column(children: [
                            /// 메인 배너 ==================================================
                            /// 피부질환 ==========================================
                            if (authState == false ||
                                resultData.data['disease'] == null ||
                                resultData.data['disease'].length == 0) ...[
                              // before
                              HomeBannerWidget(
                                imgUrl: 'assets/images/main_stack_01.png',
                                title: '나의 피부 질환을\n예측해보세요.',
                                markText: '피부 질환',
                                caption:
                                    '피부에 숨겨진 문제를 찾아,\n맞춤형 시술과 화장품을\n추천해 드립니다.',
                                onPressed: () =>
                                    authStateNotifier.navigateToPage(
                                        context, ref, 'predictSkinDisease'),
                                type: 'surgery',
                              ),
                            ] else ...[
                              // after login and predict
                              Stack(
                                children: [
                                  HomeBannerWidget(
                                      type: 'surgery',
                                      title: !stringUtil
                                              .dayFromNowReverse(resultData
                                                  .data['disease']
                                                  ?.last
                                                  ?.createdDate)!
                                              .contains('Day')
                                          ? '질환 예측 후 ${stringUtil.dayFromNowReverse(resultData.data['disease']?.last?.createdDate)}일\n지났습니다.'
                                          : '오늘 질환을\n예측했어요!',
                                      markText: !stringUtil
                                              .dayFromNowReverse(resultData
                                                  .data['disease']
                                                  ?.last
                                                  ?.createdDate)!
                                              .contains('Day')
                                          ? '질환 예측 후 ${stringUtil.dayFromNowReverse(resultData.data['disease']?.last?.createdDate)}일'
                                          : '오늘',
                                      caption: '3개월 주기 검진 권장',
                                      onPressed: () =>
                                          authStateNotifier.navigateToPage(
                                              context,
                                              ref,
                                              'predictSkinDisease'),
                                      widget: SizedBox(
                                        height: 70,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(width: 12);
                                          },
                                          scrollDirection: Axis.horizontal,
                                          itemCount: resultData
                                              .data['disease']?.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white
                                                        .withOpacity(0.5)),
                                                height: 100,
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          resultData
                                                                  .data[
                                                                      'disease']
                                                                      ?[index]
                                                                  .topk1Label ??
                                                              '-',
                                                          style: AppTextTheme
                                                              .black16b,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                        ),
                                                        Text(
                                                          stringUtil.dateTimeToString(
                                                                  value: resultData
                                                                      .data[
                                                                          'disease']
                                                                          ?[
                                                                          index]
                                                                      .createdDate,
                                                                  pattern:
                                                                      'yy.MM.dd') ??
                                                              '-',
                                                          style: AppTextTheme
                                                              .blue10m,
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(width: 10),
                                                    SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        child: resultData
                                                                    .data[
                                                                        'disease']
                                                                        ?[index]
                                                                    .imageId !=
                                                                null
                                                            ? Image.network(
                                                                '${Strings.imageUrl}${resultData.data['disease']?[index].imageId}',
                                                                fit: BoxFit
                                                                    .cover,
                                                                // 네트워크 Empty 예외처리
                                                                errorBuilder: (BuildContext
                                                                        context,
                                                                    Object
                                                                        exception,
                                                                    StackTrace?
                                                                        stackTrace) {
                                                                  return Image
                                                                      .asset(
                                                                    'assets/images/sample_images_01.png',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  );
                                                                },
                                                              )
                                                            // 이미지 아이디 Null 예외처리
                                                            : Image.asset(
                                                                'assets/images/sample_images_01.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                      ),
                                                    )
                                                  ],
                                                ));
                                          },
                                        ),
                                      )),
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
                              )
                            ],

                            /// 피부MBTI 예측하기 ===================================
                            if (authState == false ||
                                (resultData.data['mbtiInfo'] == null ||
                                    resultData.data['mbtiInfo'] == null)) ...[
                              // before
                              HomeBannerWidget(
                                bottom: -30,
                                imgUrl: 'assets/images/main_stack_02.png',
                                title: '나의 피부 MBTI가\n궁금하지 않으세요?',
                                markText: '피부 MBTI',
                                caption: 'AI로 진단 받아 보시고,\n체계적으로 관리해보세요!',
                                onPressed: () =>
                                    authStateNotifier.navigateToPage(
                                        context, ref, 'mbtiPreStartCheck'),
                                type: 'mbti',
                              ),
                            ] else ...[
                              // after
                              HomeBannerWidget(
                                type: 'mbti',
                                title: '${user.name} 님의 피부 MBTI는?',
                                onPressed: () =>
                                    authStateNotifier.navigateToPage(
                                        context, ref, 'mbtiPreStartCheck'),
                                widget: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          resultData.data['mbtiInfo']
                                                  ?.skinMbtiName ??
                                              '-',
                                          style: AppTextTheme.yellow24b),
                                      const SizedBox(height: 4),
                                      Text(
                                        resultData.data['mbtiInfo']
                                                ?.descriptionEng ??
                                            '-',
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
                                          itemCount: resultData.data['mbtiInfo']
                                              ?.keywordList?.length,
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
                                                  '#${resultData.data['mbtiInfo']?.keywordList?[index].keyword}',
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

                            /// 제품 랭킹 ==================================================
                            /// 피부 타입 별 랭킹
                            ListTitleWidget(
                              text: '피부 타입 별 랭킹',
                              markText: '피부 타입 별',
                              onTap: () => {
                                authStateNotifier.navigateToPage(
                                    context, ref, 'cosmeticProduct'),
                              },
                            ),

                            /// 피부 타입 별 카테고리
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
                                homeDataState.mainTypeCurIndex = index;
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
                            const SizedBox(height: 28),
                          ]);
                        }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 72,
                      height: 72,
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 3,
                                spreadRadius: 3)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: GestureDetector(
                        onTap: () async {
                          // 카카오톡 채널 채팅 URL
                          Uri url =
                              Uri.parse("https://pf.kakao.com/_LxnHBxl/chat");
                          // await TalkApi.instance.channelChatUrl('_LxnHBxl');

                          // 디바이스 브라우저 열기
                          try {
                            await launchBrowserTab(url);
                          } catch (error) {
                            print('카카오톡 채널 채팅 실패 $error');
                          }
                        },
                        child: Image.asset(
                          'assets/images/oxygen_floating_button.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
