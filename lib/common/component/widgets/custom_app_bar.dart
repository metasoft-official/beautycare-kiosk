import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 로고가 왼쪽에 배치된 커스텀 앱바
class CustomAppBar extends ConsumerStatefulWidget {
  const CustomAppBar({Key? key, this.bottom, this.bottomSize})
      : super(key: key);

  final PreferredSizeWidget? bottom;
  final num? bottomSize;

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 60,
      pinned: true,
      automaticallyImplyLeading: false,
      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          width: 4,
        ),
        GestureDetector(
          onTap: () => context.pushNamed('home'),
          child: const Image(
            width: 120,
            image: AssetImage(
              "assets/images/oxygen_logo.png",
            ),
          ),
        ),
        const Spacer(),
        const SizedBox(width: 10),
      ]),
      bottom: widget.bottom,
    );
  }
}
