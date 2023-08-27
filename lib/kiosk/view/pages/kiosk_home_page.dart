import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:beauty_care/kiosk/model/banner_kiosk_model.dart';
import 'package:beauty_care/kiosk/provider/kiosk_provider.dart';
import 'package:beauty_care/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KioskHomePage extends ConsumerWidget {
  const KioskHomePage({super.key});

  static String get routeName => 'kioskHome';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<BannerKioskModel> data = [];
    ref
        .watch(bannerKioskRepositoryProvider)
        .getBannerKioskByQuery()
        .then((value) => {
              if (value != null && value.items != null) {data = value.items!}
            });
    logger.d(data);
    CarouselController carouselController = CarouselController();

    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Container(
            width: double.infinity,
            height: 460,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color(0xFFCDE1F9).withOpacity(0.6),
              const Color(0xFFECF8FF).withOpacity(0.6),
              const Color(0xFFC9DDF6).withOpacity(0.6)
            ])),
            padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 190),
            child: Image.asset('assets/images/oxygen_logo.png'),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '예측할 정보를 선택해 주세요.',
                style: KioskTextTheme.black56b,
              ),
              const SizedBox(height: 72),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      // 피부 질환 예측
                      Expanded(
                        child: GestureDetector(
                          onTap: () => context.go('/kiosk-pre-check?type=질환'),
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(64, 64, 20, 20),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: AppColor.rowPrimary,
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '피부 질환',
                                        style: KioskTextTheme.yellow72b,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '예측',
                                            style: KioskTextTheme.white72b
                                                .copyWith(height: 1.2),
                                          ),
                                          const Icon(
                                            Icons.navigate_next,
                                            color: Colors.white,
                                            size: 80,
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 37),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 288,
                                          child: Image.asset(
                                            'assets/images/main_stack_01.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                              const SizedBox(height: 28),
                              const Text(
                                '내 피부 속 숨겨진 문제를\n찾아드립니다.',
                                style: KioskTextTheme.black36m,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => context.go('/kiosk-pre-check?type=MBTI'),
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(64, 64, 20, 20),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: AppColor.blue,
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '피부 MBTI',
                                        style: KioskTextTheme.yellow72b,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '예측',
                                            style: KioskTextTheme.white72b
                                                .copyWith(height: 1.2),
                                          ),
                                          const Icon(
                                            Icons.navigate_next,
                                            color: Colors.white,
                                            size: 80,
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 37),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          height: 288,
                                          child: Image.asset(
                                            'assets/images/main_stack_02.png',
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                              const SizedBox(height: 28),
                              const Text(
                                'AI로 내 피부타입 진단 받고,\n체계적으로 관리해보세요!',
                                style: KioskTextTheme.black36m,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                CarouselSlider.builder(
                    itemCount: data.length,
                    carouselController: carouselController,
                    options: CarouselOptions(
                        autoPlay: false,
                        onPageChanged: (index, reason) {},
                        height: 220),
                    itemBuilder:
                        (BuildContext context, int itemIndex, int realIndex) {
                      return data.isNotEmpty && data[itemIndex].imageId != null
                          ? Image.network(
                              '${Strings.imageUrl}${data[itemIndex].imageId}',
                              fit: BoxFit.cover,
                              // 네트워크 Empty 예외처리
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Container();
                              },
                            )
                          // 이미지 아이디 Null 예외처리
                          : Container();
                    }),
              ],
            ),
          )
        ]));
  }
}
