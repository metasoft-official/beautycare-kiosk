import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:beauty_care/kiosk/model/banner_kiosk_model.dart';
import 'package:beauty_care/kiosk/provider/kiosk_provider.dart';
import 'package:beauty_care/kiosk/view/widgets/kiosk_loading_widget.dart';

class KioskHomePage extends ConsumerWidget {
  const KioskHomePage({super.key});

  static String get routeName => 'kioskHome';

  // 질환 mbti 선택 홈 화면
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CarouselController carouselController = CarouselController();
    final asyncValue = ref.watch(kioskHomeProvider);

    return asyncValue.when(
        data: (data) {
          List<BannerKioskModel> banner = [];
          banner = data['banner'];

          return Scaffold(
              body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      const Color(0xFFCDE1F9).withOpacity(0.6),
                      const Color(0xFFECF8FF).withOpacity(0.6),
                      const Color(0xFFC9DDF6).withOpacity(0.6)
                    ])),
                    padding: const EdgeInsets.symmetric(
                        vertical: 90, horizontal: 100),
                    child: Image.asset('assets/images/oxygen_logo.png'),
                  ),
                  Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '예측할 정보를 선택해 주세요.',
                        style: KioskTextTheme.black42b,
                      ),
                      const SizedBox(height: 60),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 피부 질환 예측
                              Expanded(
                                child: GestureDetector(
                                  onTap: () =>
                                      context.go('/kiosk-pre-check?type=질환'),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 40, 40, 20),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: AppColor.rowPrimary,
                                        ),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '피부 질환',
                                                style: KioskTextTheme.yellow60b,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '예측',
                                                    style: KioskTextTheme
                                                        .white60b
                                                        .copyWith(height: 1.2),
                                                  ),
                                                  const Icon(
                                                    Icons.navigate_next,
                                                    color: Colors.white,
                                                    size: 70,
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 30),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: SizedBox(
                                                  height: 200,
                                                  child: Image.asset(
                                                    'assets/images/main_stack_01.png',
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                              )
                                            ]),
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        '내 피부 속 숨겨진 문제를\n찾아드립니다.',
                                        style: KioskTextTheme.black24m,
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
                                  onTap: () =>
                                      context.go('/kiosk-pre-check?type=MBTI'),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 40, 40, 20),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: AppColor.blue,
                                        ),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '피부 MBTI',
                                                style: KioskTextTheme.yellow60b,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '예측',
                                                    style: KioskTextTheme
                                                        .white60b
                                                        .copyWith(height: 1.2),
                                                  ),
                                                  const Icon(
                                                    Icons.navigate_next,
                                                    color: Colors.white,
                                                    size: 70,
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 30),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: SizedBox(
                                                  height: 200,
                                                  child: Image.asset(
                                                    'assets/images/main_stack_02.png',
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                              )
                                            ]),
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        'AI로 내 피부타입 진단 받고,\n체계적으로 관리해보세요!',
                                        style: KioskTextTheme.black24m,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 20),
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
                            onPageChanged: (index, reason) {},
                            height: 200,
                            autoPlay: true,
                            viewportFraction: 1,
                            enableInfiniteScroll: true,
                            padEnds: false,
                          ),
                          itemBuilder: (BuildContext context, int itemIndex,
                              int realIndex) {
                            return banner.isNotEmpty &&
                                    banner[itemIndex].imageId != null
                                ? SizedBox(
                                    width: double.infinity,
                                    child: Image.network(
                                      '${Strings.imageUrl}${banner[itemIndex].imageId}',
                                      fit: BoxFit.cover,
                                      // 네트워크 Empty 예외처리
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return Container();
                                      },
                                    ),
                                  )
                                // 이미지 아이디 Null 예외처리
                                : Container();
                          },
                        ),
                      ],
                    ),
                  )
                ]),
          ));
        },
        loading: () => const KioskLoadingWidget(),
        error: (e, s) => Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Text('Error: $e, $s'),
              ),
            ));
  }
}
