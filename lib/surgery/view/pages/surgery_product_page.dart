import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/cosmetic/provider/product_state_provider.dart';

import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/layout/app_color.dart';

import 'package:beauty_care/common/component/widgets/custom_app_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_bottom_navigation_bar.dart';
import 'package:beauty_care/surgery/view/widgets/clinic_sliver_grid_widget.dart';

class SurgeryProductPage extends ConsumerStatefulWidget {
  const SurgeryProductPage({Key? key}) : super(key: key);

  static String get routeName => 'surgeryProduct';

  @override
  SurgeryProductPageState createState() => SurgeryProductPageState();
}

class SurgeryProductPageState extends ConsumerState<SurgeryProductPage> {
  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productStateProvider);

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomBottomNavigationBar(
          child: CustomScrollView(slivers: [
            // 앱바
            const CustomAppBar(),
            // todo pinned widget
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
                    child: TextField(
                      autocorrect: false,
                      enableSuggestions: true,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            child: const Icon(
                              Icons.search,
                              color: AppColor.lightBlue,
                              size: 25,
                            ),
                            onTap: () => {},
                          ),
                          hintText: '지역명 검색',
                          hintStyle: AppTextTheme.lightBlue14,
                          enabledBorder:
                              AppBoxTheme.outlinedBlueinputBorderTheme,
                          border: AppBoxTheme.outlinedBlueinputBorderTheme,
                          contentPadding:
                              const EdgeInsets.fromLTRB(0, 10, 20, 10)),
                    ),
                  ),
                  Container(
                    color: AppColor.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    child: Row(
                      children: [
                        Image.asset('assets/images/map_image.png', width: 32),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('현재 내 지역은 서울특별시입니다.',
                                style: AppTextTheme.white14b),
                            Text('다른 지역을 선택하시겠습니까?',
                                style: AppTextTheme.white14)
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.navigate_next,
                          size: 20,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                sliver: ClinicSliverGridWidget(clinics: productState.clinics))
          ]),
        ));
  }
}
