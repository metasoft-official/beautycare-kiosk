import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/provider/auth_provider.dart';

// 로고가 왼쪽에 배치된 커스텀 앱바
class CustomAppBar extends ConsumerStatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final authStateNotifier = ref.watch(authStateProvider.notifier);

    return SliverAppBar(
      toolbarHeight: 60.0,
      pinned: true,
      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          width: 4,
        ),
        const Image(
          width: 120,
          image: AssetImage(
            "assets/images/oxygen_logo.png",
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () => context.pushNamed('login'),
          child: Image.asset('assets/icons/ic_search_grey.png', width: 16),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () => authStateNotifier.navigateToPage(context, ref, 'mypage'),
          child: Image.asset('assets/icons/ic_person_grey.png', width: 16),
        ),
        const SizedBox(width: 16),
        // noti.length == null?
        InkWell(
          onTap: () => context.pushNamed('noti'),
          child: Image.asset('assets/icons/ic_notice_grey.png', width: 16),
        ),
        //   : InkWell(
        //   onTap: () => context.pushNamed('noti'),
        //   child: Image.asset('assets/icons/ic_notice.png', width: 16),
        // ),
        const SizedBox(width: 10),
      ]),
    );
  }
}
