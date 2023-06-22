import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/component/widgets/product_grid_widget.dart';
import '../../common/layout/app_box_theme.dart';
import '../../common/layout/app_text.dart';
import '../provider/product_state_provider.dart';

class CosmeticProductPage extends ConsumerStatefulWidget {
  const CosmeticProductPage({Key? key}) : super(key: key);

  static String get routeName => 'cosmeticProduct';

  @override
  CosmeticProductPageState createState() => CosmeticProductPageState();
}

class CosmeticProductPageState extends ConsumerState<CosmeticProductPage> {
  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productStateProvider);

    return Scaffold(
        appBar: AppBar(title: const Text('화장품')),
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
                  child: ProductGridWidget(
                    // todo : model 생성 후 model 리스트 전달
                    productUrl: [
                      'https://oxygenceuticals.co.kr/product/detail.html?product_no=35&cate_no=55&display_group=1'
                    ],
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    imgUrl: ["assets/images/sample_c_01.png"],
                    category: ['수분'],
                    title: ['에이셀300 플루이드 50ml'],
                    price: ['95,000'],
                  ),
                ),
              ],
            )));
  }
}
