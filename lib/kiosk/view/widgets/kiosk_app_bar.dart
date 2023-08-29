import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:beauty_care/common/layout/app_color.dart';

class KioskAppBar extends ConsumerStatefulWidget {
  const KioskAppBar({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  KioskAppBarState createState() => KioskAppBarState();
}

class KioskAppBarState extends ConsumerState<KioskAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color ?? Colors.white,
      padding: const EdgeInsets.fromLTRB(65, 70, 65, 30),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Image(
          width: 400,
          image: AssetImage(
            "assets/images/oxygen_logo.png",
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => context.goNamed('kioskHome'),
          child:
              const Icon(Icons.home_filled, color: AppColor.appColor, size: 75),
        ),
      ]),
    );
  }
}
