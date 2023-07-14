import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

// ignore: must_be_immutable
class CustomCarouselSlider extends StatelessWidget {
  CustomCarouselSlider({
    super.key,
    required this.imageList,
    required this.controller,
    this.titles,
    this.captions,
    this.curIndex,
    this.autoPlay,
    this.onPageChanged,
    this.widget,
  });

  final List<String> imageList;
  final CarouselController controller;
  final List<String>? titles;
  final List<String>? captions;
  int? curIndex;
  final bool? autoPlay;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;

  final Widget? widget; // 메인 배너 외 슬라이더

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: imageList.length,
        carouselController: controller,
        options: CarouselOptions(
            autoPlay: false, onPageChanged: onPageChanged, height: 263),
        itemBuilder: (BuildContext context, int itemIndex, int realIndex) {
          return widget ??
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 6,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: getGradientColors(itemIndex),
                            // getGradientColors(imageList.length),
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          border:
                              Border.all(width: 0, color: AppColor.lightGrey),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          padding: const EdgeInsets.fromLTRB(12, 14, 12, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 12),
                                  Image.asset('assets/icons/ic_corner_left.png',
                                      width: 16),
                                  const Spacer(),
                                  Text(titles?[itemIndex] ?? '-',
                                      style: AppTextTheme.blue14b),
                                  const Spacer(),
                                  Image.asset(
                                    'assets/icons/ic_corner_right.png',
                                    width: 16,
                                  ),
                                  const SizedBox(width: 12),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                captions?[itemIndex] ?? '-',
                                style:
                                    AppTextTheme.black11.copyWith(height: 1.6),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 16),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    // imageList[itemIndex],
                                    imageList[itemIndex],
                                    height: 250,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: AppColor.whiteBlue,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0, color: AppColor.lightGrey),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)))),
                          onPressed: () {
                            context.pushNamed('cosmeticProduct');
                          },
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('자세히 보러가기',
                                    style: AppTextTheme.blue12b
                                        .copyWith(height: 1.0)),
                                const Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: AppColor.appColor,
                                  size: 14,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
        });
  }
}

List<Color> getGradientColors(int index) {
  List<Color> colors = [];
  int i = index >= 6 ? index % 6 : index;

  switch (i) {
    case 0:
      colors = [
        const Color(0xffFDF9CD),
        const Color(0xffFDF9CD).withOpacity(0.5)
      ];
      break;
    case 1:
      colors = [
        const Color(0xffCDE1F9),
        const Color(0xffCDE1F9).withOpacity(0.5)
      ];
      break;
    case 2:
      colors = [
        const Color(0xffFDF9CD),
        const Color(0xffFDF9CD).withOpacity(0.5)
      ];
      break;
    case 3:
      colors = [
        const Color(0xffF9EFCD),
        const Color(0xffF9EFCD).withOpacity(0.5)
      ];
      break;
    case 4:
      colors = [
        const Color(0xffF9CDCD),
        const Color(0xffF9CDCD).withOpacity(0.5)
      ];
      break;
    case 5:
      colors = [
        const Color(0xffE0F9CD),
        const Color(0xffE0F9CD).withOpacity(0.5)
      ];
      break;
  }

  return colors;
}
