import 'package:beauty_care/clinic/provider/clinic_state_provider.dart';
import 'package:beauty_care/common/component/mixins/modal_mixin.dart';
import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/disease/model/disease_model.dart';
import 'package:beauty_care/disease/provider/disease_state_provider.dart';
import 'package:beauty_care/disease/view/widgets/disease_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';

import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/list_title_widget.dart';

import '../../../main.dart';

class DiseaseSelectedPage extends ConsumerStatefulWidget {
  final DiseaseModel? disease;

  const DiseaseSelectedPage({Key? key, this.disease}) : super(key: key);

  static String get routeName => 'disease';

  @override
  DiseaseSelectedState createState() => DiseaseSelectedState();
}

class DiseaseSelectedState extends ConsumerState<DiseaseSelectedPage> {
  @override
  Widget build(BuildContext context) {
    DiseaseModel disease = widget.disease ?? DiseaseModel();
    final changeState = ref.watch(diseaseChangeProvider);
    final asyncValue = ref.watch(diseaseStateProvider(disease.id ?? -1));
    final clinicState = ref.watch(clinicStateProvider.notifier);
    final diseaseState =
        ref.watch(diseaseStateProvider(disease.id ?? -1).notifier);

    return asyncValue.when(
      data: (data) {
        final clinicList = List.from(clinicState.data['clinics']);
        final regions = clinicState.data['regions'];

        DiseaseModel diseaseModel = data['diseaseInfo'];
        logger.d(diseaseModel);

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
          body: SingleChildScrollView(
            child: Column(children: [
              // 질환 제목 및 소개 ===============================================
              // 텍스트
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(diseaseModel.name ?? '-',
                                style: AppTextTheme.blue20b),
                          ),
                          Text(
                            diseaseModel.nameEng ?? '-',
                            style: AppTextTheme.middleGrey14m,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          final selectedData =
                              await ModalMixin.filterModalBottomSheet(
                                  modalKey: 'disease',
                                  context: context,
                                  selectedValue: 0,
                                  list: data['modalData']);
                          // 선택에 따른 내용 다시 가져오기
                          diseaseState.getDiseaseById(
                              data['modalData'][selectedData].id);

                          () => context.pushNamed('disease',
                              extra: diseaseState.data['diseaseInfo']);
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(8, 6, 4, 6),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColor.appColor),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '다른 피부질환 살펴보기',
                                style:
                                    AppTextTheme.blue12m.copyWith(height: 1.2),
                              ),
                              const Icon(
                                Icons.expand_more,
                                size: 14,
                                color: AppColor.appColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // 질환 이미지
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: diseaseModel.diseaseImageId != null
                      ? Image.network(
                          '${Strings.imageUrl}${diseaseModel.diseaseImageId}',
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

              const SizedBox(height: 24),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.fromLTRB(20, 26, 20, 0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.insert_drive_file_outlined,
                          color: AppColor.appColor,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '증상',
                          style: AppTextTheme.blue12b,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      diseaseModel.symptoms ?? '-',
                      style: AppTextTheme.middleGrey12,
                    ),
                  ],
                ),
              ),

              // 자세히 보기 ====================================================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: DiseaseDetailWidget(diseaseInfo: diseaseModel),
              ),

              const SizedBox(height: 24),

              // 추천받기 ===================================================
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    // 시술클리닉 추천받기 ==============================================
                    ListTitleWidget(
                      text: '시술 / 클리닉 추천받기',
                      markText: '시술 / 클리닉',
                      onTap: () {
                        context.pushNamed('surgeryProduct');
                      },
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.lightGrey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        //todo 이미지 수정 ? 추천받기 이미지 어떻게 할 건지
                        child: Image.asset(
                          'assets/images/추천받기샘플.png',
                          height: 96,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),

                    const SizedBox(height: 33),

                    // 옥시페이셜 전문점 ================================================
                    // 제목
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        width: double.infinity,
                        child: const Text('옥시페이셜 전문점',
                            style: AppTextTheme.blue16b)),
                    const SizedBox(height: 13),

                    // 전문점 소개 슬라이더
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: CarouselSlider.builder(
                          itemCount: clinicList.length,
                          carouselController: changeState.carouselController,
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              changeState.changePage(index);
                            },
                            autoPlay: false,
                            height: 236,
                            viewportFraction: 0.48,
                            enableInfiniteScroll: false,
                            padEnds: false,
                          ),
                          itemBuilder: (BuildContext context, int itemIndex,
                              int realIndex) {
                            return Container(
                              decoration:
                                  AppBoxTheme.outlinedRoundedGreyBoxTheme,
                              margin: const EdgeInsets.only(right: 16),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10)),
                                      child: clinicList[itemIndex]
                                                  .mainImageId !=
                                              null
                                          ? Image.network(
                                              '${Strings.imageUrl}${clinicList[itemIndex].mainImageId}',
                                              fit: BoxFit.cover,
                                              // 네트워크 Empty 예외처리
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                return Image.asset(
                                                  'assets/images/sample_images_01.png',
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            )
                                          // 이미지 아이디 Null 예외처리
                                          : Image.asset(
                                              'assets/images/sample_images_01.png',
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(12, 10, 6, 8),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              regions[clinicList[itemIndex]
                                                      .addressDepth1Id] ??
                                                  '-',
                                              style: AppTextTheme.middleGrey8,
                                            ),
                                            Text(
                                              clinicList[itemIndex].name ?? '-',
                                              style: AppTextTheme.black10b,
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Expanded(
                                          child: Image.asset(
                                            'assets/icons/ic_kakao_channel.png',
                                            width: 22,
                                            height: 22,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        clinicList[itemIndex].description ??
                                            '-',
                                        style: AppTextTheme.middleGrey10
                                            .copyWith(height: 1.6),
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),

                    const SizedBox(height: 10),
                    // 슬라이더 바 인디케이터
                    Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                            color: AppColor.lowGrey,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      Container(
                        width: ((MediaQuery.of(context).size.width - 50) /
                                (clinicList.length - 1)) *
                            (changeState.curIndex + 1),
                        height: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                            color: AppColor.appColor,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ]),
                    const SizedBox(height: 32),
                  ],
                ),
              )
            ]),
          ),
          bottomNavigationBar: ButtonBottomNavigationBarWidget(
            buttonColor: AppColor.appColor,
            textStyle: AppTextTheme.white14b,
            label: '확인',
            onPressed: () => context.goNamed('home'),
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
