import 'dart:math';

import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:beauty_care/kiosk/view/widgets/kiosk_app_bar.dart';
import 'package:beauty_care/kiosk/view/widgets/kiosk_bottom_button_widget.dart';
import 'package:beauty_care/kiosk/view/widgets/kiosk_qr_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:beauty_care/mbti/provider/mbti_result_state_provider.dart';

import 'package:beauty_care/common/layout/app_color.dart';

import 'package:beauty_care/mbti/model/skin_mbti_model.dart';
import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';

class KioskMbtiResultPage extends ConsumerStatefulWidget {
  final String? surveyId;

  const KioskMbtiResultPage({Key? key, this.surveyId}) : super(key: key);

  static String get routeName => 'kioskMbtiResult';

  @override
  KioskMbtiResultState createState() => KioskMbtiResultState();
}

class KioskMbtiResultState extends ConsumerState<KioskMbtiResultPage> {
  @override
  Widget build(BuildContext context) {
    final int id = int.tryParse(widget.surveyId ?? '') ?? -1;
    final asyncValue = ref.watch(mbtiResultStateProvider(id));

    return asyncValue.when(
      data: (data) {
        SkinMbtiModel typeInfo = data['typeInfo'];

        return Scaffold(
          backgroundColor: AppColor.lightGrey,
          body: Column(children: [
            const KioskAppBar(),
            // mbti 제목 및 소개 ===============================================
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xFFCDE1F9),
                    Color(0xFFECF8FF),
                    Color(0xFFC9DDF6)
                  ])),
                ),
                // 텍스트
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 120, bottom: 0),
                      width: double.infinity,
                      // margin: const EdgeInsets.only(top: 44),
                      padding: const EdgeInsets.fromLTRB(24, 74, 22, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(90),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 1))
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          const Text('나의 피부 MBTI 결과',
                              style: KioskTextTheme.black36b),
                          Text(
                            typeInfo.skinMbtiName ?? '-',
                            style: KioskTextTheme.blue64e.copyWith(height: 1.2),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: data['subtitle']?['exceptText'] ?? '-',
                                  style: KioskTextTheme.black36b),
                              TextSpan(
                                  text: data['subtitle']?['markText'] ?? '-',
                                  style: KioskTextTheme.blue36b),
                            ]),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              typeInfo.description ?? '-',
                              style: KioskTextTheme.middleGrey24m,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          if (typeInfo.keywordList != null) ...[
                            SizedBox(
                                height: typeInfo.keywordList != null &&
                                        typeInfo.keywordList!.length > 3
                                    ? 20
                                    : 40),
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 70),
                                width: double.infinity,
                                child: const Text('피부 고민 키워드',
                                    style: KioskTextTheme.black28b)),
                            const SizedBox(height: 10),
                            GridView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 70),
                              shrinkWrap: true,
                              primary: false,
                              itemCount: typeInfo.keywordList?.length ?? 0,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: (index + 1) % 3 == 0
                                      ? const EdgeInsets.fromLTRB(0, 0, 0, 8)
                                      : const EdgeInsets.fromLTRB(0, 0, 16, 8),
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(35)),
                                      border:
                                          Border.all(color: AppColor.appColor)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '#${typeInfo.keywordList?[index].keyword}',
                                      style: KioskTextTheme.blue28b,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 3.5 / 1,
                                      crossAxisCount: 3),
                            ),
                          ],
                          SizedBox(
                              height: typeInfo.keywordList != null &&
                                      typeInfo.keywordList!.length > 3
                                  ? 40
                                  : 70)
                        ],
                      ),
                    ),
                  ],
                ),

                // mtbi별 이미지
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  height: 200,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      constraints:
                          const BoxConstraints(minWidth: 1, minHeight: 1),
                      child: Image.asset(
                          "assets/images/mbti_banni_${typeInfo.skinMbtiName}.png"),
                    ),
                  ),
                ),
              ],
            ),
            const KioskQrWidget(),
            KioskBottomButtonWidget(
              secondIcon: true,
              firstOnPressed: () => context.goNamed('kioskHome'),
              secondOnPressed: () => context.go('/kiosk-shooting?type=mbti'),
            )
          ]),
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
