import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/layout/app_text.dart';

class SurveyWidget extends ConsumerStatefulWidget {
  const SurveyWidget({super.key});

  @override
  SurveyState createState() => SurveyState();
}

class SurveyState extends ConsumerState<SurveyWidget> {
  final answers = [
    [
      '매우 거칠고, 버석거리고 각질이 들떠 보입니다.',
      '당깁니다.',
      '건조해 보이지 않고 번들거리지도 않습니다.',
      '밝은 빛에 반사되는 듯이 번들거립니다.'
    ],
    ['두번째 질문에 대한 답변 리스트', '두번째 질문에 대한 답변 어쩌구'],
    ['세번째 질문에 대한 답변 리스트', '테스트테스트']
  ];
  final questions = [
    '클렌징 후에 아무 것도 바르지 않고 2~3시간 후 밝은 빛 아래서 이마와 볼이 어떻게 보입니까?',
    '두 번째 질문?',
    '세 번째 질문입니다.'
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: questions.length,
          (context, index) {
        return Container(
          margin: const EdgeInsets.fromLTRB(24, 36, 24, 0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // 질문 ===================================================
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 질문 번호
                  Text(
                    'Q${index + 1}.',
                    style: AppTextTheme.deepGrey20,
                  ),
                  const SizedBox(width: 10),
                  // 질문 내용
                  Expanded(
                      child: Text(
                    questions[index],
                    style: AppTextTheme.black18b,
                  )),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // 한 질문에 대한 답변은 lazy 하게 나올 필요가 없다고 판단하여 ListView 사용
            // 답변 ===================================================
            ListView.builder(
                shrinkWrap: true,
                itemCount: answers[index].length,
                itemBuilder: (BuildContext context, int answerIndex) {
                  return Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.fromLTRB(
                                      24, 10, 24, 10)),
                              child: Text(
                                answers[index][answerIndex],
                                style: AppTextTheme.black14m,
                              ))));
                }),
            const SizedBox(height: 10)
          ]),
        );
      }),
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  PersistentHeader(
      {required this.widget, required this.minExtent, required this.maxExtent});

  final Widget widget;
  @override
  final double minExtent;
  @override
  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
