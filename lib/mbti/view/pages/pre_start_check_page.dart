import 'package:beauty_care/common/component/widgets/pre_check_list_widget.dart';
import 'package:beauty_care/mbti/view/widgets/survey_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/component/widgets/icon_stepper.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/mbti/provider/quiz_state_provider.dart';

class MBTIPreStartCheckPage extends ConsumerWidget {
  const MBTIPreStartCheckPage({super.key});

  static String get routeName => 'mbtiPreStartCheck';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text('Scroll to see the SliverAppBar in effect.'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 160.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('피부 MBTI 예측하기'),
    //     leading: IconButton(
    //         onPressed: () {
    //           context.goNamed('home');
    //         },
    //         icon: const Icon(Icons.arrow_back_outlined)),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Container(
    //         alignment: Alignment.center,
    //         margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
    //         child: Column(children: [
    //           const Padding(
    //               padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
    //               child: Text(
    //                 '피부 스캔 전 확인해주세요.',
    //                 style: AppTextTheme.black20b,
    //               )),
    //           const Padding(
    //             padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    //             child: Text('정확한 진단을 위해 아래 사항을 참고해주세요!',
    //                 style: AppTextTheme.black14),
    //           ),
    //
    //           //이미지
    //           Container(
    //             // width: 180,
    //             height: 180,
    //             padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), // padding
    //             margin: const EdgeInsets.fromLTRB(0, 30, 0, 20), // margin
    //             decoration: BoxDecoration(
    //               color: Colors.white, // background color
    //               // border: Border.all(color: Colors.black, width: 3), // border
    //               borderRadius: BorderRadius.circular(10.0), // border radius
    //               boxShadow: [
    //                 // box shadow
    //                 BoxShadow(
    //                   color: Colors.grey.withOpacity(0.7),
    //                   spreadRadius: 1,
    //                   blurRadius: 5,
    //                   offset: const Offset(0, 2),
    //                 ),
    //               ],
    //             ),
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(
    //                   10.0), // Adjust the radius as needed
    //               child: const Image(
    //                 image: AssetImage('assets/images/pre_check_face_image.png'),
    //               ),
    //             ),
    //           ),
    //           // 주의사항
    //           const PreCheckListWidget(
    //               // child: child,
    //               boldText: '화장하지 않은 상태',
    //               text: '로 진단하세요',
    //               iconData: Icons.clear),
    //           const PreCheckListWidget(
    //               // child: child,
    //               boldText: '조명이 어둡지 않은지',
    //               text: ' 확인하세요',
    //               iconData: Icons.wb_sunny_outlined),
    //           const PreCheckListWidget(
    //               // child: child,
    //               boldText: '앞머리는 넘긴 채',
    //               text: '로 유지해주세요',
    //               iconData: Icons.face_3),
    //           const PreCheckListWidget(
    //               // child: child,
    //               boldText: '안경, 마스크, 모자',
    //               text: '는 벗어주세요',
    //               iconData: Icons.masks_outlined)
    //         ])),
    //   ),
    //   // bottomNavigationBar: Stack(
    //   //   children: const [
    //   //     SliverAppBar(
    //   //       pinned: false,
    //   //       snap: false,
    //   //       floating: true,
    //   //       expandedHeight: 160.0,
    //   //       flexibleSpace: FlexibleSpaceBar(
    //   //         title: Text('SliverAppBar'),
    //   //         background: FlutterLogo(),
    //   //       ),
    //   //     )
    //   //   ],
    //   // ),
    // );
  }
}
