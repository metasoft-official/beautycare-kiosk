import 'package:beauty_care/common/component/widgets/gradient_bar_chart_widget.dart';
import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/common/component/widgets/mark_texts_widget.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/disease/model/disease_model.dart';
import 'package:beauty_care/disease/provider/disease_state_provider.dart';
import 'package:beauty_care/disease/view/widgets/disease_detail_widget.dart';
import 'package:beauty_care/user/model/user_disease_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';

import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/list_title_widget.dart';

class DiseaseResultPage extends ConsumerStatefulWidget {
  final String? diseaseId;

  const DiseaseResultPage({Key? key, this.diseaseId}) : super(key: key);

  static String get routeName => 'skinResult';

  @override
  DiseaseResultState createState() => DiseaseResultState();
}

class DiseaseResultState extends ConsumerState<DiseaseResultPage> {
  @override
  Widget build(BuildContext context) {
    final id = int.tryParse(widget.diseaseId ?? '') ?? -1;
    final asyncValue = ref.watch(userDiseaseStateProvider(id));
    final user = ref.read(userNotifierProvider.notifier).user;

    return asyncValue.when(
      data: (data) {
        UserDiseaseModel result = data['result'];

        return Scaffold(
          backgroundColor: AppColor.lightGrey,
          appBar: AppBar(
            title: const Text('예측결과'),
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // 제목 및 소개 ===============================================
              const SizedBox(
                height: 40,
              ),
              // 텍스트
              MarkTextsWidget(
                text: '${user.name} 님의 피부 질환 예측결과',
                defaultTextStyle: AppTextTheme.blue20b,
                markText: '${user.name}',
                markTextStyle: AppTextTheme.black20b,
              ),
              const Text(
                '증상과 가장 비슷한 피부질환 3가지를 알려드립니다.',
                style: AppTextTheme.middleGrey14m,
              ),
              const SizedBox(height: 20),
              // 이미지
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(8),
                height: 180,
                width: 180,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: result.imageId != null
                      ? Image.network(
                          '${Strings.imageUrl}${result.imageId}',
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Image.asset(
                              'assets/images/sample_images_01.png',
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.asset(
                          'assets/images/sample_images_01.png',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(height: 23),
              Expanded(
                  child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, 3),
                          blurRadius: 2,
                          spreadRadius: 0)
                    ]),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "상세 내용을 확인하고 싶은 질환을 선택하세요.",
                      style: AppTextTheme.black14m,
                    ),
                    const SizedBox(height: 20),
                    diseaseButton(context, 0, result)!,
                    diseaseButton(context, 1, result)!,
                    diseaseButton(context, 2, result)!
                  ],
                ),
              ))
            ]),
          ),
          bottomNavigationBar: ButtonBottomNavigationBarWidget(
            buttonColor: AppColor.appColor,
            textStyle: AppTextTheme.white14b,
            label: '다시 예측하기',
            onPressed: () => context.pushNamed('predictSkinDisease'),
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

Widget? diseaseButton(
    BuildContext context, int index, UserDiseaseModel result) {
  String? name = "";
  double? score = 0;
  DiseaseModel? extra = DiseaseModel();

  switch (index) {
    case 0:
      name = result.topk1Disease?.name ?? '-';
      score = (result.topk1Value! * 500).ceilToDouble();
      extra = result.topk1Disease;
      break;
    case 1:
      name = result.topk2Disease?.name ?? '-';
      score = (result.topk2Value! * 500).ceilToDouble();
      extra = result.topk2Disease;
      break;
    case 2:
      name = result.topk3Disease?.name ?? '-';
      score = (result.topk3Value! * 500).ceilToDouble();
      extra = result.topk3Disease;
      break;
  }

  return GestureDetector(
    onTap: () => context.pushNamed('disease', extra: extra),
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      width: double.infinity,
      decoration: index == 0
          ? AppBoxTheme.outlinedRoundedBlueBoxTheme
          : AppBoxTheme.outlinedRoundedGreyBoxTheme,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: name,
                        style: AppTextTheme.blue14b,
                      ),
                      TextSpan(
                          text: ' ${score.toString()}%' ?? '-',
                          style: AppTextTheme.blue14m)
                    ],
                  ),
                ),
                GradientBarChartWidget(
                  percent: score,
                  width: MediaQuery.of(context).size.width - 100,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.navigate_next,
            color: index == 0 ? AppColor.appColor : AppColor.black,
            size: 20,
          )
        ],
      ),
    ),
  );
}
