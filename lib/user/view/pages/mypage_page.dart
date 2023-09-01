import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/model/user_model.dart';
import 'package:beauty_care/common/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/user/provider/mypage_page_provider.dart';

import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

import 'package:beauty_care/common/component/mixins/mark_texts_mixin.dart';
import 'package:beauty_care/common/component/widgets/list_title_widget.dart';
import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/user/view/widgets/history_widget.dart';

import '../../../main.dart';

class MypagePage extends ConsumerStatefulWidget {
  const MypagePage({Key? key}) : super(key: key);

  static String get routeName => 'mypage';

  @override
  MypageState createState() => MypageState();
}

class MypageState extends ConsumerState<MypagePage> {
  @override
  Widget build(BuildContext context) {
    UserModel user = ref.read(userNotifierProvider);
    // final mypageState = ref.watch(mypageStateChangeProvider);
    final asyncValue = ref.watch(myPageStateProvider);

    return asyncValue.when(
      data: (data) {
        final allResult = List.from(data['allResult']);
        return Scaffold(
            appBar: AppBar(
              title: const Text('마이페이지'),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: InkWell(
                    onTap: () => context.pushNamed('setting'),
                    child:
                        Image.asset('assets/icons/ic_setting.png', width: 20),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(24, 40, 24, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 프로필 ========================================================
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    border: Border.all(
                                        color: AppColor.lightGrey, width: 2)),
                                width: 50,
                                height: 50,
                                child: ClipOval(
                                  child: user.profileImageId != null
                                      ? Image.network(
                                          '${Strings.imageUrl}${user.profileImageId}',
                                          fit: BoxFit.cover,
                                          // 네트워크 Empty 예외처리
                                          errorBuilder: (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                            return Image.asset(
                                              "assets/images/character_coiz_3.png",
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        )
                                      // 이미지 아이디 Null 예외처리
                                      : Image.asset(
                                          "assets/images/character_coiz_3.png",
                                          fit: BoxFit.cover,
                                        ),
                                )),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: AppTextTheme.black16m,
                                      children: markTextsMixin(
                                          '${user.name} 님, 환영합니다!',
                                          '${user.name}',
                                          AppTextTheme.blue16b),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${user.email}',
                                    style: AppTextTheme.grey12m,
                                  )
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.pushNamed('profileEdit');
                              },
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(0)),
                              child: Text(
                                '편집',
                                style: AppTextTheme.blue12b.copyWith(
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      // 바로가기 버튼 ==================================================
                      // 위시리스트
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: AppButtonTheme.outlinedBasicButtonTheme,
                            onPressed: () => context.pushNamed('wishlist'),
                            child: const Text('위시리스트')),
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
                Expanded(
                  child: HistoryWidget(
                    // onLongPress: (index) => {
                    //   mypageState.longClickState == -1
                    //       ? {
                    //           mypageState.isLongClicked[index] = true,
                    //           mypageState.longClickState = index
                    //         }
                    //       : mypageState.longClickState = -1,
                    //   mypageState.resetState()
                    // },
                    // longPressedDecoration: mypageState.longClickState > -1
                    //     ? AppBoxTheme.outlineRoundedLongPressedBoxTheme
                    //     : null,
                    itemCount: allResult.length,
                    histories: allResult,
                    nullType: 'history',
                  ),
                )
              ],
            ),
            bottomNavigationBar: ButtonBottomNavigationBarWidget(
              buttonColor: AppColor.lightGrey,
              textStyle: AppTextTheme.blue14b,
              label: ' 로그아웃',
              onPressed: () {
                ref.watch(userNotifierProvider.notifier).update(UserModel());
                logger.d(ref.read(userNotifierProvider));
                ref.read(authStateProvider.notifier).logOut();
                context.goNamed('home');
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: AppColor.appColor,
                size: 20,
              ),
            )
            //   bottomNavigationBar: mypageState.longClickState == -1
            //       ? ButtonBottomNavigationBarWidget(
            //           buttonColor: AppColor.lightGrey,
            //           textStyle: AppTextTheme.blue14b,
            //           label: ' 로그아웃',
            //           onPressed: () {
            //             ref.watch(authStateProvider.notifier).logOut();
            //             context.goNamed('home');
            //           },
            //           icon: const Icon(
            //             Icons.exit_to_app,
            //             color: AppColor.appColor,
            //             size: 20,
            //           ),
            //         )
            //       : Padding(
            //           padding:
            //               const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Flexible(
            //                 flex: 1,
            //                 child: SizedBox(
            //                   width: double.infinity,
            //                   child: ElevatedButton(
            //                     style: AppButtonTheme.outlinedBasicButtonTheme,
            //                     onPressed: () => {
            //                       mypageState.longClickState = -1,
            //                       mypageState.resetState()
            //                     },
            //                     child:
            //                         const Text('취소', style: AppTextTheme.blue16b),
            //                   ),
            //                 ),
            //               ),
            //               const SizedBox(width: 12),
            //               Flexible(
            //                   flex: 1,
            //                   child: SizedBox(
            //                     width: double.infinity,
            //                     child: ElevatedButton(
            //                       onPressed: () {},
            //                       child: const Text(
            //                         '결과 공유하기',
            //                         style: AppTextTheme.white16b,
            //                       ),
            //                     ),
            //                   ))
            //             ],
            //           ),
            //         ),
            );
      },
      loading: () => const LoadingCircleAnimationWidget(),
      error: (e, s) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text('Error: $e'),
        ),
      ),
    );
  }
}
