import 'package:beauty_care/common/component/widgets/gradient_bar_chart_widget.dart';
import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/mbti/model/skin_mbti_caretip_model.dart';
import 'package:beauty_care/mbti/model/skin_mbti_model.dart';
import 'package:beauty_care/user/model/user_skin_mbti_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/mbti/provider/mbti_result_state_provider.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/component/widgets/mark_texts_widget.dart';

class TypeDetailWidget extends ConsumerWidget {
  const TypeDetailWidget(
      {Key? key, this.id, this.result, this.info, this.exceptSubtitle})
      : super(key: key);

  final int? id;
  final UserSkinMbtiModel? result;
  final SkinMbtiModel? info;
  final String? exceptSubtitle;

  // 관리법
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changeState = ref.watch(mbtiResultChangeProvider);

    return changeState.isDetailClicked == false
        ? InkWell(
            onTap: changeState.clickDetailBtn,
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
                          return Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [scoreWidget(index, result!, context)!],
                            ),
                          );
                        }),
                  ),

                  const SizedBox(height: 36),
                  // 관리법 =====================================================
                  // 제목
                  MarkTextsWidget(
                    text: "$exceptSubtitle${info?.skinMbtiName}형",
                    markText: '${info?.skinMbtiName}형',
                    defaultTextStyle: AppTextTheme.black16b,
                    markTextStyle: AppTextTheme.blue16b,
                  ),
                  const SizedBox(height: 4),
                  const Text("어떻게 관리해야 하나요?", style: AppTextTheme.grey12m),
                  const SizedBox(height: 16),

                  // 케어법
                  if (info != null && info?.caretipList != null) ...[
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
                                itemCount: info?.caretipList?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  SkinMbtiCaretipModel? careTip =
                                      info?.caretipList?[index];
                                  return careTip != null
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '\u2022',
                                                    style: AppTextTheme.blue12b
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            height: 1.2),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Expanded(
                                                    child: Text(
                                                      careTip.content ?? '-',
                                                      style: AppTextTheme
                                                          .black12
                                                          .copyWith(
                                                              height: 1.3),
                                                      softWrap: true,
                                                      maxLines: 5,
                                                      textAlign:
                                                          TextAlign.justify,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              if (index !=
                                                  info!.caretipList!.length -
                                                      1) ...[
                                                const SizedBox(height: 8)
                                              ]
                                            ])
                                      : null;
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                  const SizedBox(height: 36),
                  InkWell(
                    onTap: changeState.clickDetailBtn,
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

Widget? scoreWidget(int index, UserSkinMbtiModel result, BuildContext context) {
  List<String>? types = [];
  String? category = "";
  double? score = 0;

  switch (index) {
    case 0:
      types = ['건성 피부', '지성 피부'];
      category = '지건성';
      score = result.category1Score?.ceilToDouble();
      break;
    case 1:
      types = ['저항성 강한 피부', '매우 민감한 피부'];
      category = '색소';
      score = result.category2Score?.ceilToDouble();
      break;
    case 2:
      types = ['비색소성', '색소성'];
      category = '민감';
      score = result.category3Score?.ceilToDouble();
      break;
    case 3:
      types = ['탄력 피부', '주름 취약 피부'];
      category = '주름';
      score = result.category4Score?.ceilToDouble();
      break;
  }

  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            types[0],
            style: AppTextTheme.purple12b,
            textAlign: TextAlign.left,
          )),
          Align(
            alignment: Alignment.center,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: category,
                style: AppTextTheme.black12m,
              ),
              TextSpan(
                text: ' $score%',
                style: AppTextTheme.black12b,
              ),
            ])),
          ),
          Expanded(
              child: Text(types[1],
                  style: AppTextTheme.blue12b, textAlign: TextAlign.right)),
        ],
      ),
      GradientBarChartWidget(
        percent: score,
        backgourndColor: Colors.white,
        width: MediaQuery.of(context).size.width,
      ),
      const SizedBox(height: 16)
    ],
  );
}
