import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/promotion/provider/promotion_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/common/component/widgets/custom_app_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/mixins/hide_navigation_bar_mixin.dart';

class PromotionMainPage extends ConsumerStatefulWidget {
  const PromotionMainPage({Key? key}) : super(key: key);

  static String get routeName => 'promotion';

  @override
  PromotionMainPageState createState() => PromotionMainPageState();
}

class PromotionMainPageState extends ConsumerState<PromotionMainPage> {
  HideNavbar promotionHiding = HideNavbar();

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(promotionStateProvider);
    final state = ref.watch(promotionStateProvider.notifier);

    return asyncValue.when(
      data: (data) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomBottomNavigationBar(
            child: CustomScrollView(
              controller: promotionHiding.controller,
              slivers: [
                const CustomAppBar(),
                // 카테고리 ======================================================
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: List.generate(
                            data['categoryName'].length,
                            (index) => Expanded(
                                  child: Container(
                                    margin:
                                        index != data['categoryName'].length - 1
                                            ? const EdgeInsets.only(right: 8)
                                            : null,
                                    child: TextButton(
                                        style: state.selectedIndex == index
                                            ? AppButtonTheme
                                                .basicBlueTextButtonTheme
                                            : AppButtonTheme
                                                .outlinedGreyTextButtonTheme,
                                        onPressed: () {
                                          state.selectCategory(index);
                                        },
                                        child: Text(
                                            data['categoryName'][index].name ??
                                                '-')),
                                  ),
                                )),
                      ),
                    ),
                  ),
                ),
                // 프로모션 =======================================================
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final promotion = data['promotions'][index];
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 1),
                                blurRadius: 3,
                                spreadRadius: 2,
                                color: AppColor.grey.withOpacity(0.1)),
                          ]),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 20),
                      child: Column(
                        children: [
                          // 프로모션 이미지
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: promotion.promotionImageId != null
                                ? Image.network(
                                    "${Strings.imageUrl}${promotion.promotionImageId}",
                                    height: 140,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Image.asset(
                                        'assets/images/character_coiz_3.png',
                                        height: 140,
                                        fit: BoxFit.scaleDown,
                                      );
                                    },
                                  )
                                : Image.asset(
                                    'assets/images/character_coiz_3.png',
                                    height: 140,
                                    fit: BoxFit.scaleDown,
                                  ),
                          ),
                          // 프로모션 명
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 14),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Colors.white),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            color:
                                                AppColor.red.withOpacity(0.3)),
                                        child: Text(
                                          'D-${stringUtil.dayFromNow(promotion.endDate)}',
                                          style: AppTextTheme.red10m
                                              .copyWith(height: 1.0),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '${stringUtil.dateTimeToString(value: promotion.endDate, pattern: 'MM.dd')}까지' ??
                                            '-',
                                        style: AppTextTheme.middleGrey10,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(promotion.title ?? '-',
                                    style: AppTextTheme.black12b),
                                const SizedBox(height: 4),
                                Text(promotion.description ?? '-',
                                    style: AppTextTheme.blue10m, maxLines: 2),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: data['promotions'].length,
                ))
              ],
            ),
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
