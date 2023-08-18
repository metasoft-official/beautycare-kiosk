import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/main.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/oxyfacial/provider/oxy_facial_state_provider.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/common/component/widgets/custom_app_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/mixins/hide_navigation_bar_mixin.dart';

class OxyFacialMainPage extends ConsumerStatefulWidget {
  const OxyFacialMainPage({Key? key}) : super(key: key);

  static String get routeName => 'oxyFacial';

  @override
  OxyFacialMainPageState createState() => OxyFacialMainPageState();
}

class OxyFacialMainPageState extends ConsumerState<OxyFacialMainPage> {
  HideNavbar oxyFacialHiding = HideNavbar();

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(oxyFacialStateProvider);
    logger.d(asyncValue);

    return asyncValue.when(
      data: (data) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomBottomNavigationBar(
            child: CustomScrollView(
              controller: oxyFacialHiding.controller,
              slivers: [
                const CustomAppBar(),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final oxy = data['oxyFacial'][index];
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.lightGrey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 20),
                      child: Column(
                        children: [
                          // 시술 이미지
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: oxy.backgroundImageId != null
                                ? Image.network(
                                    "${Strings.imageUrl}${oxy.backgroundImageId}",
                                    height: 140,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Image.asset(
                                        'assets/images/character_coiz_3.png',
                                        height: 140,
                                        fit: BoxFit.scaleDown,
                                      );
                                    },
                                  )
                                : Image.asset(
                                    'assets/images/character_coiz_3.png',
                                    height: 140,
                                    fit: BoxFit.scaleDown,
                                  ),
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
                                        text: oxy.nameEng ?? '-',
                                        style: AppTextTheme.black16b),
                                    const TextSpan(text: '  '),
                                    TextSpan(
                                        text: oxy.name ?? '-',
                                        style: AppTextTheme.blue14),
                                  ]),
                                )),
                          ),
                          // 해시태그
                          if (oxy.itemList != null &&
                              oxy.itemList.length != 0) ...[
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      for (var i = 0;
                                          i < oxy.itemList?.length;
                                          i++) ...[
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 12),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(35)),
                                              border: Border.all(
                                                  color: AppColor.appColor)),
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              '#${oxy.itemList[i].item ?? '-'}',
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
                            )
                          ],
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
                                              child: oxy.deviceImageId != null
                                                  ? Image.network(
                                                      '${Strings.imageUrl}${oxy.deviceImageId}',
                                                      errorBuilder:
                                                          (BuildContext context,
                                                              Object exception,
                                                              StackTrace?
                                                                  stackTrace) {
                                                        return Image.asset(
                                                          'assets/images/character_coiz_3.png',
                                                        );
                                                      },
                                                    )
                                                  : Image.asset(
                                                      'assets/images/character_coiz_3.png',
                                                    ),
                                            )),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          oxy.name ?? '-',
                                          style: AppTextTheme.black12b,
                                        ),
                                        const SizedBox(height: 4),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            oxy.description ?? '-',
                                            style: AppTextTheme.black10,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                  },
                  childCount: data['oxyFacial'].length,
                ))
              ],
            ),
          ),
        );
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
