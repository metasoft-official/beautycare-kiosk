import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/disease/model/disease_model.dart';
import 'package:beauty_care/disease/provider/disease_state_provider.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

class DiseaseDetailWidget extends ConsumerWidget {
  final DiseaseModel diseaseInfo;

  const DiseaseDetailWidget({Key? key, required this.diseaseInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(diseaseChangeProvider);

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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Column(children: [
              ...detail(title: '원인', content: diseaseInfo.cause ?? '-'),
              if (diseaseInfo.treatment != null)
                ...detail(title: '검사', content: diseaseInfo.test ?? '-'),
              ...detail(title: '치료', content: diseaseInfo.treatment ?? '-'),
              ...detail(title: '예방', content: diseaseInfo.prevention ?? '-'),
              InkWell(
                onTap: detailState.clickDetailBtn,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  color: Colors.transparent,
                  width: double.infinity,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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

List<Widget> detail({required String title, required String content}) {
  return [
    Row(
      children: [
        const Icon(
          Icons.insert_drive_file_outlined,
          color: AppColor.appColor,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: AppTextTheme.blue12b,
        )
      ],
    ),
    const SizedBox(height: 8),
    Text(
      content,
      style: AppTextTheme.middleGrey12,
    ),
    const SizedBox(height: 36),
  ];
}
