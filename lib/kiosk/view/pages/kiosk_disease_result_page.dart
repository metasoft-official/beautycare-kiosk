import 'package:beauty_care/common/component/widgets/gradient_bar_chart_widget.dart';
import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:beauty_care/disease/model/disease_model.dart';
import 'package:beauty_care/disease/provider/disease_state_provider.dart';
import 'package:beauty_care/kiosk/view/widgets/kiosk_app_bar.dart';
import 'package:beauty_care/kiosk/view/widgets/kiosk_bottom_button_widget.dart';
import 'package:beauty_care/kiosk/view/widgets/kiosk_qr_widget.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/user/model/user_disease_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';

import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';

class KioskDiseaseResultPage extends ConsumerStatefulWidget {
  final String? diseaseId;

  const KioskDiseaseResultPage({Key? key, this.diseaseId}) : super(key: key);

  static String get routeName => 'kioskDiseaseResult';

  @override
  KioskDiseaseResultState createState() => KioskDiseaseResultState();
}

class KioskDiseaseResultState extends ConsumerState<KioskDiseaseResultPage> {
  @override
  Widget build(BuildContext context) {
    final id = int.tryParse(widget.diseaseId ?? '') ?? -1;
    final asyncValue = ref.watch(userDiseaseStateProvider(id));

    return asyncValue.when(
      data: (data) {
        UserDiseaseModel result = data['result'];
        return Scaffold(
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 1))
                        ],
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(90),
                            bottomRight: Radius.circular(90))),
                    child: Column(
                      children: [
                        const KioskAppBar(),
                        // 제목 및 소개 ===============================================
                        // 이미지
                        Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(8),
                          height: 400,
                          width: 400,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: result.imageId != null
                                ? Image.network(
                                    '${Strings.imageUrl}${result.imageId}',
                                    fit: BoxFit.cover,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
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
                        const SizedBox(height: 30),
                        // 텍스트
                        const Text(
                          '당신의 증상과 가장 비슷한 피부질환',
                          style: KioskTextTheme.black48b,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                          ),
                          child: diseaseButton(context, 0, result)!,
                        ),
                        const SizedBox(height: 50)
                      ],
                    ),
                  ),
                  const KioskQrWidget(),
                  KioskBottomButtonWidget(
                    secondIcon: true,
                    firstOnPressed: () => context.goNamed('kioskHome'),
                    secondOnPressed: () =>
                        context.go('/kiosk-shooting?type=질환'),
                  )
                ]),
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
      if (score >= 100) {
        score = (result.topk1Value! * 300).ceilToDouble();
      }
      extra = result.topk1Disease;
      break;
    case 1:
      name = result.topk2Disease?.name ?? '-';
      score = (result.topk2Value! * 500).ceilToDouble();
      if (score >= 100) {
        score = (result.topk2Value! * 300).ceilToDouble();
      }
      extra = result.topk2Disease;
      break;
    case 2:
      name = result.topk3Disease?.name ?? '-';
      score = (result.topk3Value! * 500).ceilToDouble();
      if (score >= 100) {
        score = (result.topk3Value! * 300).ceilToDouble();
      }
      extra = result.topk3Disease;
      break;
  }

  return GestureDetector(
    onTap: () => {
      extra != null
          ? context.pushNamed('kioskDisease', extra: extra)
          : toastMessage.topRedBoxWhiteText('저장된 질환 정보가 없어 이동이 불가합니다.')
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 72),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      width: double.infinity,
      decoration: AppBoxTheme.outlinedRoundedBlueBoxTheme.copyWith(
          border: Border.all(
            width: 2,
            color: AppColor.appColor,
          ),
          borderRadius: BorderRadius.circular(20)),
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
                        style: AppTextTheme.blue36m,
                      ),
                      TextSpan(
                          text: ' ${score.toString()}%' ?? '-',
                          style: AppTextTheme.blue36m)
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                GradientBarChartWidget(
                    backgourndColor: Colors.white,
                    percent: score,
                    width: MediaQuery.of(context).size.width - 100,
                    height: 30),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Icon(
            Icons.navigate_next,
            color: index == 0 ? AppColor.appColor : AppColor.black,
            size: 50,
          )
        ],
      ),
    ),
  );
}
