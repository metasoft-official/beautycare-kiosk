import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';

// 이미지와 내용이 Row 형태인 리스트 공통 위젯
class HistoryWidget extends StatelessWidget {
  const HistoryWidget(
      {Key? key,
      required this.itemCount,
      required this.nullMessage,
      this.decoration,
      this.margin,
      this.padding,
      this.histories})
      : super(key: key);

  final int itemCount;
  final String nullMessage;

  final BoxDecoration? decoration;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  // todo: history entity 사용
  final List<Map<String, dynamic>>? histories;

  @override
  Widget build(BuildContext context) {
    return itemCount == 0

        // 아이템이 없는 경우 버튼 생성
        ? Container(
            margin: const EdgeInsets.fromLTRB(24, 50, 24, 30),
            child: Column(children: [
              Text('$nullMessage이 없습니다.', style: AppTextTheme.black18b),
            ]))

        // 아이템이 있는 경우 리스트 생성
        : CustomScrollView(slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(childCount: itemCount,
                  (context, index) {
                return InkWell(
                  // 리스트 각 요소 선택 시 이벤트
                  onTap: () => context.pushNamed('mbtiResult'), //todo 각 요소로 이동
                  child: Container(
                    decoration: decoration ??
                        AppBoxTheme.outlinedRoundedWitheBoxTheme, // 전체 박스
                    margin: margin ?? const EdgeInsets.fromLTRB(24, 12, 24, 0),
                    padding: padding ?? const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        // 이미지
                        // if (imgUrl != null && imgUrl!.length >= itemCount) ...[
                        Container(
                          decoration: AppBoxTheme.greyBoxTheme,
                          width: 56,
                          height: 56,
                          // todo : network
                          child: Image.asset(
                            histories?[index]['imgUrl'] ??
                                'assets/images/sample_cat_01.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),

                        // 텍스트 내용 (null값 추후 수정)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 2),
                              Text(
                                histories?[index]['title'] ?? '-',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextTheme.black16b,
                              ),
                              Text(
                                histories?[index]['caption'] ?? '-',
                                style: AppTextTheme.middleGrey12m,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                histories?[index]['date'] ?? '-',
                                style: AppTextTheme.blue12m,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            )
          ]);
  }
}
