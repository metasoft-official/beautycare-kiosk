// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// import 'package:beauty_care/mbti/provider/mbti_result_state_provider.dart';
//
// import 'package:beauty_care/common/layout/app_color.dart';
// import 'package:beauty_care/common/layout/app_box_theme.dart';
// import 'package:beauty_care/common/layout/app_text.dart';
//
// import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
// import 'package:beauty_care/common/component/widgets/list_title_widget.dart';
// import 'package:beauty_care/skin/view/widgets/skin_detail_widget.dart';
//
// final sizeProvider = StateProvider<Size>((ref) => Size.zero);
//
// // ignore: camel_case_types
// class SkinResultPage extends ConsumerStatefulWidget {
//   const SkinResultPage({Key? key}) : super(key: key);
//
//   static String get routeName => 'skinResult';
//
//   @override
//   SkinResultState createState() => SkinResultState();
// }
//
// // 상태관리 중인 부분 provider 분리 필요
//
// class SkinResultState extends ConsumerState<SkinResultPage> {
//   @override
//   Widget build(BuildContext context) {
//     final resultState = ref.watch(mbtiResultStateProvider);
//
//     return Scaffold(
//       backgroundColor: AppColor.lightGrey,
//       appBar: AppBar(
//         title: const Text('예측결과'),
//         leading: IconButton(
//           onPressed: () {
//             context.pop();
//           },
//           icon: const Icon(Icons.arrow_back_rounded),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           // 질환 제목 및 소개 ===============================================
//           // 텍스트
//           Padding(
//             padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
//             child: Row(
//               children: [
//                 const Text('습진', style: AppTextTheme.blue20b),
//                 const SizedBox(width: 4),
//                 const Text('Psoriasis', style: AppTextTheme.middleGrey14m),
//                 const Spacer(),
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border.all(color: AppColor.appColor),
//                   ),
//                   child: Row(
//                     children: [
//                       Text(
//                         '다른 피부질환 살펴보기',
//                         style: AppTextTheme.blue12m.copyWith(height: 1.2),
//                       ),
//                       const Icon(
//                         Icons.arrow_drop_down,
//                         size: 10,
//                         color: AppColor.appColor,
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.asset('assets/images/sample_images_01.png'),
//             ),
//           ),
//
//           const SizedBox(height: 24),
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 24),
//             padding: const EdgeInsets.fromLTRB(20, 26, 20, 0),
//             decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10))),
//             child: const Column(
//               children: [
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.insert_drive_file_outlined,
//                       color: AppColor.appColor,
//                       size: 16,
//                     ),
//                     SizedBox(width: 4),
//                     Text('증상')
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   '피부에 은백색의 인설이 겹겹이 쌓인 붉은 구진이 생기며 점차 서로 뭉치거나 커져서 판을 형성하면서 퍼져나가는 피부질환이다. 병변은 주로 팔꿈치나 무릎, 두피에 생기지만 전신에 날 수 있으며 일부에서 가려운 경우가 있지만 심하지는 않다. 건선 관절염이 동반되어 관절 증상이 나타나거나 손발톱 변형이 동반되는 경우도 있다.',
//                   style: AppTextTheme.middleGrey12,
//                 ),
//               ],
//             ),
//           ),
//
//           // 자세히 보기 ====================================================
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24),
//             child: SkinDetailWidget(),
//           ),
//
//           const SizedBox(height: 24),
//
//           // 추천받기 ===================================================
//           Container(
//             color: Colors.white,
//             child: Column(
//               children: [
//                 // 시술클리닉 추천받기 ==============================================
//                 ListTitleWidget(
//                   text: '시술 / 클리닉 추천받기',
//                   markText: '시술 / 클리닉',
//                   onTap: () {
//                     context.pushNamed('surgeryProduct');
//                   },
//                 ),
//
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 24),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: AppColor.lightGrey),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.all(Radius.circular(10)),
//                     child: Image.asset(
//                       'assets/images/추천받기샘플.png',
//                       height: 96,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 33),
//
//                 // 옥시페이셜 전문점 ================================================
//                 // 제목
//                 Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 24),
//                     width: double.infinity,
//                     child:
//                         const Text('옥시페이셜 전문점', style: AppTextTheme.blue16b)),
//                 const SizedBox(height: 13),
//
//                 // 전문점 소개 슬라이더
//                 Padding(
//                   padding: const EdgeInsets.only(left: 24),
//                   child: CarouselSlider.builder(
//                       itemCount: resultState.clinicList.length,
//                       carouselController: resultState.carouselController,
//                       options: CarouselOptions(
//                         onPageChanged: (index, reason) {
//                           resultState.changePage(index);
//                         },
//                         autoPlay: false,
//                         height: 236,
//                         viewportFraction: 0.48,
//                         enableInfiniteScroll: false,
//                         padEnds: false,
//                       ),
//                       itemBuilder:
//                           (BuildContext context, int itemIndex, int realIndex) {
//                         return Container(
//                           decoration: AppBoxTheme.outlinedRoundedGreyBoxTheme,
//                           margin: const EdgeInsets.only(right: 16),
//                           child: Column(
//                             children: [
//                               ClipRRect(
//                                 borderRadius: const BorderRadius.only(
//                                     topRight: Radius.circular(10),
//                                     topLeft: Radius.circular(10)),
//                                 child: Image.asset(
//                                   resultState.clinicList[itemIndex]['img'] ??
//                                       'assets/images/sample_images_01.png',
//                                   height: 100,
//                                   width: double.infinity,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.fromLTRB(12, 10, 6, 8),
//                                 child: Row(
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           resultState.clinicList[itemIndex]
//                                               ['address'],
//                                           style: AppTextTheme.middleGrey8,
//                                         ),
//                                         Text(
//                                           resultState.clinicList[itemIndex]
//                                               ['name'],
//                                           style: AppTextTheme.black10b,
//                                         )
//                                       ],
//                                     ),
//                                     const Spacer(),
//                                     Expanded(
//                                       child: Image.asset(
//                                         'assets/icons/ic_kakao_channel.png',
//                                         width: 22,
//                                         height: 22,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 12, right: 12),
//                                 child: Text(
//                                   resultState.clinicList[itemIndex]
//                                       ['description'],
//                                   style: AppTextTheme.middleGrey10
//                                       .copyWith(height: 1.6),
//                                   maxLines: 5,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                       }),
//                 ),
//
//                 const SizedBox(height: 10),
//                 // 슬라이더 바 인디케이터
//                 Stack(children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width - 50,
//                     height: 4,
//                     margin: const EdgeInsets.symmetric(horizontal: 24),
//                     decoration: BoxDecoration(
//                         color: AppColor.lowGrey,
//                         borderRadius: BorderRadius.circular(30)),
//                   ),
//                   Container(
//                     width: ((MediaQuery.of(context).size.width - 50) /
//                             (resultState.clinicList.length - 1)) *
//                         (resultState.curIndex + 1),
//                     height: 4,
//                     margin: const EdgeInsets.symmetric(horizontal: 24),
//                     decoration: BoxDecoration(
//                         color: AppColor.appColor,
//                         borderRadius: BorderRadius.circular(30)),
//                   ),
//                 ]),
//                 const SizedBox(height: 32),
//               ],
//             ),
//           )
//         ]),
//       ),
//       bottomNavigationBar: ButtonBottomNavigationBarWidget(
//         buttonColor: AppColor.appColor,
//         textStyle: AppTextTheme.white14b,
//         label: '확인',
//         onPressed: () => context.goNamed('home'),
//       ),
//     );
//   }
// }
//
// Map<String, String> splitMarkText(String text) {
//   List<String> splitTexts = text.split(' ');
//   int i = text.indexOf(splitTexts[splitTexts.length - 1]);
//
//   String markText = splitTexts[(splitTexts.length - 1)];
//   String exceptText = text.substring(0, i);
//
//   return {'exceptText': exceptText, 'markText': markText};
// }
