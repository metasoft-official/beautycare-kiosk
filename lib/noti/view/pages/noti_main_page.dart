import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/main.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/noti/provider/noti_state_provider.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/layout/app_color.dart';

class NotiMainPage extends ConsumerStatefulWidget {
  const NotiMainPage({Key? key}) : super(key: key);

  static String get routeName => 'noti';

  @override
  NotiMainPageState createState() => NotiMainPageState();
}

class NotiMainPageState extends ConsumerState<NotiMainPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final notiState = ref.read(notiStateProvider);
      notiState.resetState();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final notiState = ref.watch(notiStateProvider);
    final asyncValue = ref.watch(notiDataProvider);

    return asyncValue.when(
        data: (data) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('알림'),
            ),
            body: data.isEmpty
                // 알림이 없는 경우
                ? Container(
                    padding: const EdgeInsets.fromLTRB(24, 30, 24, 60),
                    width: double.infinity,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_off_outlined,
                          color: AppColor.appColor,
                          size: 43,
                        ),
                        SizedBox(height: 4),
                        Text(
                          '알림이 없습니다.',
                          style: AppTextTheme.black20m,
                        )
                      ],
                    ),
                  )

                // 알림이 있는 경우
                : CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: data.length, (context, index) {
                          return InkWell(
                            // 리스트 각 요소 선택 시 이벤트
                            onTap: () {
                              // todo 각 요소에 맞게 이동 또는 팝업
                              // 확인 처리
                              // data(index);
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white), // 전체 박스
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 12, 20),
                                    child: Row(
                                      children: [
                                        //아이콘
                                        Image.asset(
                                            'assets/icons/ic_noti_system.png',
                                            width: 20),
                                        const SizedBox(width: 8),
                                        Text(
                                          data[index].categoryName ?? '-',
                                          style: AppTextTheme.middleGrey12,
                                          textAlign: TextAlign.justify,
                                        ),
                                        const Spacer(),
                                        Text(
                                          stringUtil.dateTimeToString(
                                                  value:
                                                      data[index].createdDate,
                                                  pattern: 'yy.MM.dd') ??
                                              '-',
                                          style: AppTextTheme.middleGrey12,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 48),
                                    child: Text(
                                      data[index].subject ?? '-',
                                      style: AppTextTheme.black16m,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Divider(
                                    height: 1,
                                    color: AppColor.semiGrey,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
          );
        },
        loading: () => const LoadingCircleAnimationWidget(),
        error: (e, s) => Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Text('Error: $e, $s'),
              ),
            ));
  }
}
