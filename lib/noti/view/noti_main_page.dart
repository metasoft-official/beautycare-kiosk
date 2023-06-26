import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/noti/provider/noti_state_provider.dart';
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
    final notiState = ref.watch(notiStateProvider);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('알림'),
      ),
      body: notiState.notiTypeList.isEmpty
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
                      childCount: notiState.notiTypeList.length,
                      (context, index) {
                    return InkWell(
                      // 리스트 각 요소 선택 시 이벤트
                      onTap: () {
                        // todo 각 요소에 맞게 이동 또는 팝업
                        // 확인 처리
                        notiState.checkNoti(index);
                      },
                      child: Container(
                        decoration: notiState.isCheckedNoti[index] == true
                            ? const BoxDecoration(color: AppColor.lightGrey)
                            : const BoxDecoration(
                                color: AppColor.appColor), // 전체 박스
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          children: [
                            // 아이콘 필요하면 추가
                            // const Icon(Icons.add_business),
                            // 텍스트 내용 (null값 추후 수정)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          notiState.notiTypeList[index],
                                          style:
                                              notiState.isCheckedNoti[index] ==
                                                      true
                                                  ? AppTextTheme.grey12m
                                                  : AppTextTheme.white12m,
                                        ),
                                        Text(
                                          notiState.notiDateList[index],
                                          style:
                                              notiState.isCheckedNoti[index] ==
                                                      true
                                                  ? AppTextTheme.grey12m
                                                  : AppTextTheme.white12m,
                                        )
                                      ]),
                                  Text(
                                    notiState.contentsList[index],
                                    style:
                                        notiState.isCheckedNoti[index] == true
                                            ? AppTextTheme.black16m
                                            : AppTextTheme.white16m,
                                  )
                                ],
                              ),
                            ),
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
