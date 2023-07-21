import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/mbti/provider/mbti_result_state_provider.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/component/widgets/mark_texts_widget.dart';

class TypeDetailWidget extends ConsumerWidget {
  const TypeDetailWidget({Key? key}) : super(key: key);

  // 관리법
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(mbtiResultStateProvider);

    return detailState.isDetailClicked == false
        ? InkWell(
            onTap: detailState.clickDetailBtn,
            child: Container(
              color: AppColor.lightGrey,
              padding: const EdgeInsets.only(bottom: 28),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 3),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                ),
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.expand_more,
                      size: 20,
                    ),
                    Text(
                      '자세히',
                      style: AppTextTheme.middleGrey12b,
                    )
                  ],
                ),
              ),
            ),
          )
        : Container(
            color: AppColor.lightGrey,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 상세 피부타입 ===============================================
                  // 제목
                  Container(
                    decoration: AppBoxTheme
                        .outlinedRoundedBlueTransparentBoxTheme
                        .copyWith(
                      border: Border.all(color: AppColor.appColor, width: 2),
                    ),
                    padding: const EdgeInsets.fromLTRB(29, 8, 29, 8),
                    child: Text(
                      '상세 피부 타입',
                      style: AppTextTheme.blue16b.copyWith(height: 1.0),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('문항 중 각 항목 별 관련 응답에 따라 작성되었습니다.',
                      style: AppTextTheme.middleGrey12),
                  const SizedBox(height: 16),
                  // 그래프
                  SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        primary: false, //스크롤 제한
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 4),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(detailState.types[index][0]),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: detailState.fourType[index],
                                        style: AppTextTheme.black12m,
                                      ),
                                      TextSpan(
                                        text:
                                            '${detailState.result[0]['score'][detailState.fourType[index]].toString()}%',
                                        style: AppTextTheme.black12b,
                                      ),
                                    ])),
                                    Text(detailState.types[index][1]),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),

                  const SizedBox(height: 36),
                  // 관리법 =====================================================
                  // 제목
                  const MarkTextsWidget(
                    text: "민감하고, 색소침착이 잘 되는 DSPT형",
                    markText: 'DSPT형',
                    defaultTextStyle: AppTextTheme.black16b,
                    markTextStyle: AppTextTheme.blue16b,
                  ),
                  const SizedBox(height: 4),
                  const Text("어떻게 관리해야 하나요?", style: AppTextTheme.grey12m),
                  const SizedBox(height: 16),

                  // 케어법
                  Container(
                    decoration: AppBoxTheme.basicShadowWhiteBoxTheme,
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                decoration: BoxDecoration(
                                  color: AppColor
                                      .appColor, // arbitrary color choice
                                  borderRadius: BorderRadius.circular(
                                      25), // rounded corner for nicer look
                                ),
                                child: Text(
                                  '케어법',
                                  style: AppTextTheme.white16b
                                      .copyWith(height: 1.2),
                                ),
                              ),
                            ]),
                        const SizedBox(height: 12),
                        SingleChildScrollView(
                          child: ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: detailState
                                  .result[0]['skinMbtiCareTip'].length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '\u2022',
                                            style: AppTextTheme.blue12b
                                                .copyWith(
                                                    fontWeight: FontWeight.w900,
                                                    height: 1.0),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            detailState.result[0]
                                                ['skinMbtiCareTip'][index],
                                            style: AppTextTheme.black12m
                                                .copyWith(height: 1.0),
                                          )
                                        ],
                                      ),
                                      if (index !=
                                          detailState
                                                  .result[0]['skinMbtiCareTip']
                                                  .length -
                                              1) ...[const SizedBox(height: 12)]
                                    ]);
                              }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  InkWell(
                    onTap: detailState.clickDetailBtn,
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.expand_less,
                            size: 20,
                          ),
                          Text(
                            '접기',
                            style: AppTextTheme.middleGrey12b,
                          )
                        ],
                      ),
                    ),
                  )
                ]),
          );
  }
}
