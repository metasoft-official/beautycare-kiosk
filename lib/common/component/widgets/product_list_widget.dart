import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/component/widgets/mark_texts_widget.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget(
      {Key? key,
      required this.products,
      required this.lankVisible,
      required this.btnVisible,
      this.btnText,
      this.markText,
      this.btnUrlName,
      required this.imgVisible,
      this.imgUrl})
      : super(key: key);

  // final List<Cosmetic>? products;
  final List<Map<String, dynamic>> products;

  // lank
  final bool lankVisible;

  // btn
  final bool btnVisible;
  final String? btnText;
  final String? markText;
  final String? btnUrlName;

  // img
  final bool imgVisible;
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return products.length == 1
        ? Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.lightGrey),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                // 이미지 설명
                if (imgVisible == true) ...[
                  Image.asset(
                    imgUrl ?? 'assets/images/banni_postcare.png',
                    height: 140,
                    fit: imgUrl != null ? BoxFit.cover : BoxFit.scaleDown,
                    width: double.infinity,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${products[0]['category']} 제품',
                          style: AppTextTheme.black14b,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '시술 후 자극으로 피부 표피층이 얇아져 민감해진 피부에 수분을 채워주고 피부 장벽을 강화시켜 줍니다.',
                          style: AppTextTheme.middleGrey12,
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 14, 28, 14),
                  child: InkWell(
                    onTap: () {
                      context.goNamed(products[0]['productUrl']);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 70,
                          child: Align(
                            alignment: Alignment.center,
                            child: SimpleShadow(
                              opacity: 0.2,
                              sigma: 4,
                              color: AppColor.black,
                              child: Image.asset(
                                products[0]['image'] ??
                                    'assets/images/sample_c_01.png',
                                width: 50,
                                height: 60,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[0]['category'] ??
                                    products[0]['skintypeCategory'] ??
                                    '-',
                                style: AppTextTheme.middleGrey8,
                              ),
                              Text(
                                products[0]['name'] ?? '-',
                                style: AppTextTheme.black10b,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                              const SizedBox(height: 4),
                              RichText(
                                  text: TextSpan(
                                      style: AppTextTheme.middleGrey10,
                                      children: [
                                    TextSpan(
                                        text: products[0]['price'] ?? '-',
                                        style: AppTextTheme.black14b),
                                    const TextSpan(text: '원')
                                  ]))
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.navigate_next,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ),

                // 버튼
                if (btnVisible == true) ...[
                  InkWell(
                    onTap: () {
                      btnUrlName ?? context.goNamed(btnUrlName!);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const BoxDecoration(
                          color: AppColor.superLightGrey,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MarkTextsWidget(
                            markText: markText ?? '-',
                            text: btnText ?? '-',
                            defaultTextStyle:
                                AppTextTheme.black12m.copyWith(height: 1.2),
                            markTextStyle:
                                AppTextTheme.blue12b.copyWith(height: 1.2),
                          ),
                          const Icon(
                            Icons.navigate_next,
                            color: AppColor.appColor,
                            size: 14,
                          )
                        ],
                      ),
                    ),
                  )
                ]
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.lightGrey),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      primary: false, //스크롤 제한
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            if (lankVisible == true) ...[
                              const SizedBox(width: 24),
                              Text(
                                '${index + 1}',
                                style:
                                    AppTextTheme.black14b.copyWith(height: 1.2),
                              ),
                            ],
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(8, 8, 16, 8),
                                    child: InkWell(
                                      onTap: () {
                                        context
                                            .goNamed(products[0]['productUrl']);
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 70,
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: SimpleShadow(
                                                opacity: 0.2,
                                                sigma: 4,
                                                color: AppColor.black,
                                                child: Image.asset(
                                                  products[index]['image'] ??
                                                      'assets/images/sample_c_01.png',
                                                  width: 50,
                                                  height: 60,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  products[index]['category'] ??
                                                      '-',
                                                  style:
                                                      AppTextTheme.middleGrey8,
                                                ),
                                                Text(
                                                  products[index]['name'] ??
                                                      '-',
                                                  style: AppTextTheme.black10b,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.clip,
                                                ),
                                                const SizedBox(height: 4),
                                                RichText(
                                                    text: TextSpan(
                                                        style: AppTextTheme
                                                            .middleGrey10,
                                                        children: [
                                                      TextSpan(
                                                          text: products[index]
                                                                  ['price'] ??
                                                              '-',
                                                          style: AppTextTheme
                                                              .black14b),
                                                      const TextSpan(text: '원')
                                                    ]))
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.navigate_next,
                                            size: 14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (index != products.length - 1) ...[
                                    const Divider(
                                      height: 16,
                                    )
                                  ]
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                if (btnVisible != null && btnVisible == true) ...[
                  InkWell(
                    onTap: () {
                      context.goNamed(btnUrlName!);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: const BoxDecoration(
                          color: AppColor.superLightGrey,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MarkTextsWidget(
                            markText: markText ?? '-',
                            text: btnText ?? '-',
                            defaultTextStyle:
                                AppTextTheme.black12m.copyWith(height: 1.0),
                            markTextStyle:
                                AppTextTheme.blue12b.copyWith(height: 1.0),
                          ),
                          const Icon(
                            Icons.navigate_next,
                            color: AppColor.appColor,
                            size: 14,
                          )
                        ],
                      ),
                    ),
                  )
                ]
              ],
            ),
          );
  }
}
