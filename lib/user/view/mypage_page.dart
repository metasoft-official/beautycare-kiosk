import 'package:beauty_care/common/component/mixins/mark_texts_mixin.dart';
import 'package:beauty_care/common/component/widgets/list_title_widget.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'history_widget.dart';

class MypagePage extends ConsumerStatefulWidget {
  const MypagePage({Key? key}) : super(key: key);

  static String get routeName => 'mypage';

  @override
  MypageState createState() => MypageState();
}

class MypageState extends ConsumerState<MypagePage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('마이페이지')),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 40, 24, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 프로필 ========================================================
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          border:
                              Border.all(color: AppColor.lightGrey, width: 2)),
                      width: 50,
                      height: 50,
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                            "assets/images/emoji_sample_profile.png"),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: AppTextTheme.black16m,
                            children: markTextsMixin('${user.name} 님, 환영합니다!',
                                '${user.name}', AppTextTheme.blue16b),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${user.email}',
                          style: AppTextTheme.grey12m,
                        )
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0)),
                      child: Text(
                        '편집',
                        style: AppTextTheme.blue12b
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),

                // 바로가기 버튼 ==================================================
                Row(
                  children: [
                    // 위시리스트
                    Expanded(
                        child: ElevatedButton(
                            style: AppButtonTheme.outlinedBasicButtonTheme,
                            onPressed: () => context.pushNamed('wishlist'),
                            child: const Text('위시리스트'))),
                    const SizedBox(width: 12),
                    // 피부 변화
                    Expanded(
                      child: ElevatedButton(
                          style: AppButtonTheme.outlinedBasicButtonTheme,
                          onPressed: () => {},
                          child: const Text('피부 변화 그래프')),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Divider(
            thickness: 15,
          ),
          // 예측 이력 ===========================================================
          // 제목
          ListTitleWidget(
            text: '예측이력',
            onTap: () => context.pushNamed('history'),
            btnText: '전체보기',
          ),
          // 목록
          const Expanded(
            child: HistoryWidget(
              itemCount: 3,
              buttonText: '예측하러 가기',
              routerName: 'skin-predict-surgery',
              nullMessage: '예측 결과가 없어요!',
              titles: ['DRPT', 'DRPT', '습진'],
              captions: [
                'Oily, Resistant, Non-pigmented, Tight',
                'Oily, Resistant, Non-pigmented, Tight',
                'eczema'
              ],
              imgUrl: [
                'assets/images/emoji_sample_profile.png',
                'assets/images/sample_images_02.png',
                'assets/images/sample_images_03.png'
              ],
            ),
          )
        ],
      ),
    );
  }
}
