import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

class CustomCarouselSlider extends StatelessWidget {
  CustomCarouselSlider({
    super.key,
    required this.imageList,
    required this.title,
    required this.caption,
    this.autoPlay,
    this.onPageChanged,
  });

  final List<String> imageList;
  final String title;
  final String caption;
  bool? autoPlay;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        onPageChanged: onPageChanged,
      ),
      items: imageList.map((image) {
        return Builder(builder: (BuildContext context) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.lightGrey),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xffCDE1F9),
                            const Color(0xffCDE1F9).withOpacity(0.5)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      padding: const EdgeInsets.fromLTRB(12, 14, 12, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const SizedBox(width: 24),
                                Image.asset('assets/icons/ic_corner_left.png',
                                    width: 16),
                                const Spacer(),
                                Text(title, style: AppTextTheme.blue14b),
                                const Spacer(),
                                Image.asset(
                                  'assets/icons/ic_corner_right.png',
                                  width: 16,
                                ),
                                const SizedBox(width: 24),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            caption,
                            style: AppTextTheme.black11,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                image,
                                fit: BoxFit.fitWidth,
                                height: 250,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  backgroundColor: AppColor.whiteBlue,
                                  shape: const RoundedRectangleBorder(
                                      side:
                                          BorderSide(color: AppColor.lightGrey),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)))),
                              onPressed: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('자세히 보러가기', style: AppTextTheme.blue12b),
                                  Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: AppColor.appColor,
                                    size: 14,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      }).toList(),
    );
  }
}
