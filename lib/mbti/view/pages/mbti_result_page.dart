import 'dart:math';

import 'package:beauty_care/clinic/provider/clinic_state_provider.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/mbti/model/skin_mbti_model.dart';
import 'package:beauty_care/user/model/user_skin_mbti_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/mbti/provider/mbti_result_state_provider.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';

import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/list_title_widget.dart';
import 'package:beauty_care/common/component/widgets/product_list_widget.dart';
import 'package:beauty_care/mbti/view/widgets/type_detail_widget.dart';

import '../../../main.dart';

final sizeProvider = StateProvider<Size>((ref) => Size.zero);

class MbtiResultPage extends ConsumerStatefulWidget {
  final String? surveyId;

  const MbtiResultPage({Key? key, this.surveyId}) : super(key: key);

  static String get routeName => 'mbtiResult';

  @override
  MbtiResultState createState() => MbtiResultState();
}

class MbtiResultState extends ConsumerState<MbtiResultPage> {
  @override
  Widget build(BuildContext context) {
    final int id = int.tryParse(widget.surveyId ?? '') ?? -1;
    final user = ref.watch(userNotifierProvider);
    final asyncValue = ref.watch(mbtiResultStateProvider(id));
    final clinicState = ref.read(clinicStateProvider.notifier);
    final changeState = ref.watch(mbtiResultChangeProvider);

    return asyncValue.when(
      data: (data) {
        UserSkinMbtiModel result = data['result'];
        SkinMbtiModel typeInfo = data['typeInfo'];
        final clinicList = List.from(clinicState.data['clinics']);
        final regions = clinicState.data['regions'];

        double calculatedWidth = ((MediaQuery.of(context).size.width - 50) /
                (clinicList.length - 1)) *
            (changeState.curIndex + 1);

        // width가 0보다 작아지는 경우를 방지
        calculatedWidth = max(0, calculatedWidth);

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
                          margin: EdgeInsets.only(
                              top: 106,
                              bottom: changeState.isDetailClicked == false
                                  ? 0
                                  : 10),
                          width: double.infinity,
                          // margin: const EdgeInsets.only(top: 44),
                          padding: EdgeInsets.fromLTRB(24, 74, 22,
                              changeState.isDetailClicked == false ? 0 : 24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: changeState.isDetailClicked == false
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))
                                : BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 6.0,
                                spreadRadius: 2,
                                offset: const Offset(2, 4),
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: user.name,
                                  style: AppTextTheme.black14b,
                                ),
                                const TextSpan(
                                    text: '님의 피부 MBTI 결과',
                                    style: AppTextTheme.black14)
                              ])),
                              Text(
                                typeInfo.skinMbtiName ?? '-',
                                style: AppTextTheme.blue36b,
                              ),
                              Text(
                                typeInfo.descriptionEng ?? '-',
                                style: AppTextTheme.middleGrey12m,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: data['subtitle']?['exceptText'] ??
                                          '-',
                                      style: AppTextTheme.black16b),
                                  TextSpan(
                                      text:
                                          data['subtitle']?['markText'] ?? '-',
                                      style: AppTextTheme.blue16b),
                                ]),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  typeInfo.description ?? '-',
                                  style: AppTextTheme.middleGrey12,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              if (typeInfo.keywordList != null) ...[
                                const SizedBox(height: 20),
                                const SizedBox(
                                    width: double.infinity,
                                    child: Text('피부 고민 키워드',
                                        style: AppTextTheme.black14b)),
                                const SizedBox(height: 10),
                                GridView.builder(
                                  padding: const EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: typeInfo.keywordList?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: (index + 1) % 3 == 0
                                          ? const EdgeInsets.fromLTRB(
                                              0, 0, 0, 8)
                                          : const EdgeInsets.fromLTRB(
                                              0, 0, 16, 8),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(35)),
                                          border: Border.all(
                                              color: AppColor.appColor)),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '#${typeInfo.keywordList?[index].keyword}',
                                          style: AppTextTheme.blue13b,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                  },
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 2.6 / 1,
                                          crossAxisCount: 3),
                                ),
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),

                    //todo mbti image asset 추가
                    // mtbi별 이미지
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      height: 158,
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

                // 자세히 보기 ====================================================
                TypeDetailWidget(id: id, result: result, info: typeInfo),

                // 제품 추천받기 ======================================히=============
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      if (typeInfo.skincareProductList != null) ...[
                        ListTitleWidget(
                          text: '제품 추천받기',
                          markText: '제품',
                          onTap: () {
                            context.pushNamed('cosmeticProduct');
                          },
                        ),
                        ProductListWidget(
                          imgVisible: true,
                          products:
                              List.from(data['typeInfo']?.skincareProductList),
                          lankVisible: false,
                          btnVisible: true,
                          btnText: '더 많은 상품 보러가기',
                          markText: '더 많은 상품',
                          imgUrl: 'assets/images/포스트케어.jpg',
                          btnUrlName: 'cosmeticProduct',
                        ),
                      ],

                      const SizedBox(height: 8),

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
                                                errorBuilder: (BuildContext
                                                        context,
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
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 10, 6, 8),
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
                                                clinicList[itemIndex].name ??
                                                    '-',
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
                          width: calculatedWidth,
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
            ));
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
