import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/mbti/provider/mbti_result_state_provider.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/component/widgets/mark_texts_widget.dart';

class SkinDetailWidget extends ConsumerWidget {
  const SkinDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(mbtiResultStateProvider);

    return detailState.isDetailClicked == false
        ? InkWell(
            onTap: detailState.clickDetailBtn,
            child: Container(
              color: AppColor.lightGrey,
              padding: const EdgeInsets.only(bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 3),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
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
            padding: const EdgeInsets.fromLTRB(20, 26, 20, 0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Column(children: [
              Row(
                children: const [
                  Icon(
                    Icons.insert_drive_file_outlined,
                    color: AppColor.appColor,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text('원인')
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                '건선의 원인은 아직 완전히 밝혀져 있지 않으나 유전적 요인 및 환경적 자극 요인, 약물, 상기도 감염 등에 의해 발생한다고 알려져 있다. 건선 환자에서는 피부에 정상적으로 존재하는 면역세포인 T세포가 과도하게 활성화되어 피부의 각질세포를 자극하여 각질 세포의 과도한 증식과 염증을 유도한다.',
                style: AppTextTheme.middleGrey12,
              ),
              const SizedBox(height: 36),
              InkWell(
                onTap: detailState.clickDetailBtn,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
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
