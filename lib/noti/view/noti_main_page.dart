import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/noti/provider/noti_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/layout/app_color.dart';
import '../../main.dart';

class NotiMainPage extends ConsumerStatefulWidget {
  const NotiMainPage({Key? key}) : super(key: key);

  static String get routeName => 'noti';

  @override
  NotiMainPageState createState() => NotiMainPageState();
}

class NotiMainPageState extends ConsumerState<NotiMainPage> {
  @override
  Widget build(BuildContext context) {
    final notiState = ref.watch(notiStateProvider);
    logger.d(notiState.notiList);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('알림'),
      ),
      body: notiState.notiList!.isEmpty
          // 알림이 없는 경우
          ? Container(
              padding: const EdgeInsets.fromLTRB(24, 30, 24, 60),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.notifications_off_outlined,
                    color: AppColor.appColor,
                    size: 60,
                  ),
                  SizedBox(height: 8),
                  Text(
                    '알림이 없습니다.',
                    style: AppTextTheme.black20b,
                  )
                ],
              ),
            )

          // 알림이 있는 경우
          : CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: notiState.notiList?.length, (context, index) {
                    return InkWell(
                      // 리스트 각 요소 선택 시 이벤트
                      onTap: () {}, //todo 각 요소에 맞게 이동
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Colors.white), // 전체 박스
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            // 텍스트 내용 (null값 추후 수정)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notiState.notiList?[index] ?? '알림',
                                  style: AppTextTheme.grey12m,
                                ),
                                const Text(
                                  '5월 19일 14:00 ~ 17:00에는 시스템 점검이 있습니다.',
                                  style: AppTextTheme.black14m,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
    ));
  }
}
