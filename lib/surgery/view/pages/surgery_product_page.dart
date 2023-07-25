import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/component/widgets/product_grid_widget.dart';
import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/cosmetic/provider/product_state_provider.dart';

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
        appBar: AppBar(title: const Text('시술')),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
            child: Column(
              children: [
                TextFormField(
                  autocorrect: false,
                  enableSuggestions: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      prefixIcon: GestureDetector(
                        child: const Icon(
                          Icons.search,
                          color: Colors.blueAccent,
                          size: 25,
                        ),
                        onTap: () => {},
                      ),
                      hintText: '검색',
                      hintStyle: AppTextTheme.blue16m,
                      enabledBorder: AppBoxTheme.outlinedBlueinputBorderTheme,
                      border: AppBoxTheme.outlinedBlueinputBorderTheme,
                      contentPadding: const EdgeInsets.fromLTRB(0, 10, 20, 10)),
                ),
                const Expanded(
                  child: CustomScrollView(
                    slivers: [
                      ProductGridWidget(
                          // todo : model 생성 후 model 리스트 전달
                          productUrl: [
                            'https://oxygenceuticals.co.kr/etc/equipment.html'
                          ],
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          imgUrl: ["assets/images/sample_m_1.png"],
                          category: ['엠레드 클리닉'],
                          title: ['순수산소테라피']),
                    ],
                  ),
                ),
              ],
            )));
  }
}
