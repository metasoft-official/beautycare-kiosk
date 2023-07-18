import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';

final sizeProvider = StateProvider<Size>((ref) => Size.zero);

// ignore: camel_case_types
class MbtiResultPage extends ConsumerStatefulWidget {
  const MbtiResultPage({Key? key}) : super(key: key);

  static String get routeName => 'mbtiResult';

  @override
  MbtiResultState createState() => MbtiResultState();
}

class MbtiResultState extends ConsumerState<MbtiResultPage> {
  final mbtiResult = "DRPT";
  final mbtiDetail = "여드름&모공 하나 보이지 않는 타고난 달걀피부";
  final mbtiDetailCaption = "민감하지 않고, 주름이 적은 건성피부를 가지고 있습니다.";
  final skinTroubles = ['유분과다', '주름'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('예측결과'),
        leading: IconButton(
          onPressed: () {
            context.pop();
            context.goNamed('home');
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 16),
          child: Column(children: [
            // mbti 제목 및 소개 ===============================================
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                // 텍스트
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 44),
                  padding: const EdgeInsets.fromLTRB(24, 40, 22, 22),
                  decoration: AppBoxTheme.basicShadowWhiteBoxTheme,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "ddd님의 피부 MBTI 결과",
                        style: AppTextTheme.black18b,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        mbtiResult,
                        style: AppTextTheme.black24b,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        mbtiDetail,
                        style: AppTextTheme.black16m,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        mbtiDetailCaption,
                        style: AppTextTheme.grey12m,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),

                // mtbi별 이미지
                Image.asset("assets/images/sample_cat_01.png"),
              ],
            ),

            // 피부고민 ========================================================
            Container(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
              margin: const EdgeInsets.only(top: 16),
              width: MediaQuery.of(context).size.width,
              decoration: AppBoxTheme.basicShadowWhiteBoxTheme,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("피부고민", style: AppTextTheme.black18b),
                  const SizedBox(height: 8),
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 4.0, // gap between lines
                        children: skinTroubles.map((trouble) {
                          return Container(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                              color:
                                  AppColor.appColor, // arbitrary color choice
                              borderRadius: BorderRadius.circular(
                                  20), // rounded corner for nicer look
                            ),
                            child: Text(
                              trouble,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),

            // 관리법 =========================================================
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
              margin: const EdgeInsets.only(top: 16),
              decoration: AppBoxTheme.basicShadowWhiteBoxTheme,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("민감하고 주름이 적은 DRPT형", style: AppTextTheme.black18b),
                  const SizedBox(height: 4),
                  const Text("어떻게 관리해야 하나요?", style: AppTextTheme.grey12m),
                  const SizedBox(height: 8),

                  // 문제점
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
                      decoration: BoxDecoration(
                        color: AppColor.appColor, // arbitrary color choice
                        borderRadius: BorderRadius.circular(
                            20), // rounded corner for nicer look
                      ),
                      child: const Text(
                        '문제점',
                        style: AppTextTheme.white16b,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('#얼룩덜룩 민감한 피부', style: AppTextTheme.blue16b)
                  ]),
                  const SizedBox(height: 8),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      '피부장벽이 약화되면서 민감 증상이 쉽게 나타날 수 있어요.',
                      style: AppTextTheme.black12m,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 케어법
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
                      decoration: BoxDecoration(
                        color: AppColor.appColor, // arbitrary color choice
                        borderRadius: BorderRadius.circular(
                            20), // rounded corner for nicer look
                      ),
                      child: const Text(
                        '케어법',
                        style: AppTextTheme.white16b,
                      ),
                    ),
                  ]),
                  const SizedBox(height: 8),

                  // TODO : 데이터 형태에 따라 리스트로 가거나 데이터 쪼개서 표현
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        '·',
                        style: AppTextTheme.black20b,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '장벽 케어 기능의 보습제 바르기',
                        style: AppTextTheme.black12m,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )
                ],
              ),
            ),

            // 추천 시술 =======================================================
            Container(
              margin: const EdgeInsets.fromLTRB(8, 22, 8, 8),
              width: MediaQuery.of(context).size.width,
              child: const Text(
                'AI가 추천하는 시술 TOP3',
                style: AppTextTheme.black20b,
                textAlign: TextAlign.start,
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: Wrap(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                        decoration: AppBoxTheme.basicShadowWhiteBoxTheme,
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Image.asset(
                                  "assets/images/sample_m_${index + 1}.png"),
                              const Text('사적인 슈링크&윤곽주사'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(4, 16, 4, 0),
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.refresh,
                  size: 16,
                ),
                style: AppButtonTheme.outlinedRoundedLightButtonTheme,
                onPressed: () {},
                label: const Text('다른 시술 추천받기'),
              ),
            ),

            // 화장품 추천 =====================================================
            Container(
              decoration: AppBoxTheme.basicShadowWhiteBoxTheme,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.fromLTRB(22, 16, 22, 16),
              child: Column(
                children: [
                  const Text(
                    'AI가 추천하는 화장품 만나보기',
                    style: AppTextTheme.black20b,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: Wrap(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                              decoration: AppBoxTheme.greyBoxTheme,
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Image.asset(
                                        "assets/images/sample_c_0${index + 1}.png"),
                                    const Text(
                                      '에어셀300 플루이드',
                                      style: AppTextTheme.black16b,
                                      textAlign: TextAlign.start,
                                    ),
                                    const Text(
                                      '수분 플루이드',
                                      style: AppTextTheme.black14,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                  ),
                  // 더보기 버튼
                  Container(
                    margin: const EdgeInsets.fromLTRB(4, 16, 4, 0),
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.refresh,
                        size: 16,
                      ),
                      style: AppButtonTheme.outlinedRoundedLightButtonTheme,
                      onPressed: () {},
                      label: const Text('화장품 더보기'),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
