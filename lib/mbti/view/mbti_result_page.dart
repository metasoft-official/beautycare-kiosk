import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/layout/app_color.dart';

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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 40, 22, 16),
            child: Column(children: [
              // mbti 제목 및 소개
              Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  // 텍스트
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.fromLTRB(22, 40, 22, 22),
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
                  // 이미지
                  const CircleAvatar(
                    backgroundImage:
                        // todo : network image 연결? or 기본 이미지 모두 저장해서 asset으로 로드
                        // NetworkImage(
                        //     "${Strings.imageUrl}${commentList[i].integratedAttachFileNumRepresentImage}"),),
                        AssetImage("assets/images/sample_images_01.png"),
                    radius: 30,
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
                margin: const EdgeInsets.all(8),
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
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
              )
            ]),
          ),
        ),
      ),
    );
  }
}
