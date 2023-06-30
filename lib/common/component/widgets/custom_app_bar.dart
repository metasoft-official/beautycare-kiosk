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
        IconButton(
          onPressed: () => context.pushNamed('login'),
          icon: const Icon(
            Icons.search,
            color: AppColor.grey,
          ),
        ),
        IconButton(
          onPressed: () =>
              authStateNotifier.navigateToPage(context, ref, 'mypage'),
          icon: const Icon(
            Icons.person_2_outlined,
            color: AppColor.grey,
          ),
        ),
        IconButton(
          onPressed: () => context.pushNamed('noti'),
          icon: const Icon(
            Icons.notifications_outlined,
            color: AppColor.grey,
          ),
        ),
      ]),
    );
  }
}
