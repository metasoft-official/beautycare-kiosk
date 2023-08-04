import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/main.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/provider/home_state_provider.dart';
import 'package:beauty_care/oxyfacial/provider/oxyfacial_state_provider.dart';

import 'package:beauty_care/common/component/widgets/custom_app_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_bottom_navigation_bar.dart';

class OxyfacialMainPage extends ConsumerStatefulWidget {
  const OxyfacialMainPage({Key? key}) : super(key: key);

  static String get routeName => 'oxyfacial';

  @override
  OxyfacialMainPageState createState() => OxyfacialMainPageState();
}

class OxyfacialMainPageState extends ConsumerState<OxyfacialMainPage> {
  @override
  Widget build(BuildContext context) {
    final oxyfacialState = ref.watch(oxyfacialStateProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomBottomNavigationBar(
        child: CustomScrollView(
          controller: hiding.controller,
          slivers: [
            const CustomAppBar(),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    childCount: oxyfacialState.oxyfacials.length,
                    (context, index) {
              final oxy = oxyfacialState.oxyfacials[index];
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.lightGrey),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  children: [
                    // 시술 이미지
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.asset(oxy['coverImage'],
                          height: 140,
                          fit: BoxFit.cover,
                          width: double.infinity),
                    ),
                    const SizedBox(height: 10),
                    // 제품명
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: oxy['engName'],
                                  style: AppTextTheme.black16b),
                              const TextSpan(text: '  '),
                              TextSpan(
                                  text: oxy['krName'],
                                  style: AppTextTheme.blue14),
                            ]),
                          )),
                    ),
                    // 해시태그
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var i = 0;
                                  i < oxy['keywords'].length;
                                  i++) ...[
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 12),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(35)),
                                      border:
                                          Border.all(color: AppColor.appColor)),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      '#${oxy['keywords'][i]}',
                                      style: AppTextTheme.blue10b,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ]
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(height: 1),
                    // 바로가기
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: AppColor.boardPreviewBox,
                              height: 72,
                              width: 72,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Container(
                                        constraints: const BoxConstraints(
                                            minWidth: 1, minHeight: 1),
                                        child: Image.asset(
                                          oxy['oxyfacialImage'] ??
                                              'assets/images/sample_m_01.png',
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    oxy['krName'] ?? '-',
                                    style: AppTextTheme.black12b,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    oxy['description'] ?? '-',
                                    style: AppTextTheme.black10,
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.navigate_next,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}
