import 'package:beauty_care/common/component/widgets/custom_tabbar_view_widget.dart';
import 'package:beauty_care/common/component/widgets/custom_tabbar_widget.dart';
import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/common/component/widgets/product_sliver_grid_widget.dart';
import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/model/search_trend_model.dart';
import 'package:beauty_care/common/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  static String get routeName => 'search';

  @override
  SearchState createState() => SearchState();
}

class SearchState extends ConsumerState<SearchPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      final searchState = ref.watch(searchDataProvider.notifier);
      searchState.reload();
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(searchDataProvider);
    final searchState = ref.watch(searchDataProvider.notifier);

    return asyncValue.when(
      data: (data) {
        List<SearchTrendModel> trend = data['trend'];
        logger.d(data['product']);

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 24, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.keyboard_backspace, size: 24),
                        color: Colors.black,
                        onPressed: () => context.pop(),
                      ),
                      Expanded(
                        child: TextField(
                          autocorrect: false,
                          enableSuggestions: true,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.go,
                          controller: searchState.content,
                          onSubmitted: (value) {
                            searchState.submitContent(value);
                          },
                          decoration: InputDecoration(
                              prefixIcon: GestureDetector(
                                child: const Icon(
                                  Icons.search,
                                  color: AppColor.lightBlue,
                                  size: 25,
                                ),
                                onTap: () => {},
                              ),
                              hintText: '검색어를 입력하세요.',
                              hintStyle: AppTextTheme.lightBlue14,
                              enabledBorder:
                                  AppBoxTheme.outlinedBlueinputBorderTheme,
                              border: AppBoxTheme.outlinedBlueinputBorderTheme,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(0, 4, 20, 4)),
                        ),
                      ),
                    ],
                  ),
                ),
                //Todo 검색 기록
                const Divider(thickness: 10, height: 50),

                if (!searchState.isSubmitted) ...[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 16, 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('검색 트렌드', style: AppTextTheme.black18b),
                    ),
                  ),
                ],
                // 검색 트렌드
                Expanded(
                  child: CustomScrollView(slivers: [
                    if (!searchState.isSubmitted) ...[
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Container(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '전체 트렌드',
                                  // trend[index].title.toString() ?? '-',
                                  style: AppTextTheme.grey12,
                                ),
                                Text(
                                  trend[index].searchKeyword ?? '-',
                                  style: AppTextTheme.black14m,
                                )
                              ],
                            ),
                          );
                        }, childCount: 10),
                      )
                    ] else ...[
                      SliverToBoxAdapter(
                        child: CustomTabbarWidget(
                          titles: const ['전체', '클리닉', '스킨케어'],
                          tabController: tabController,
                        ),
                      ),
                      if (tabController.index == 0) ...[
                        const SliverToBoxAdapter(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 20),
                          child: Text('클리닉', style: AppTextTheme.black20b),
                        )),
                        if (data['clinic'] != null &&
                            data['clinic'] != [] &&
                            data['clinic']?.isNotEmpty) ...[
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 20),
                            sliver: ProductSliverGridWidget(
                              products: data['clinic'] ?? [],
                            ),
                          )
                        ] else ...[
                          const SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 0),
                              child: Text('검색 결과가 없습니다.',
                                  style: AppTextTheme.grey14m),
                            ),
                          )
                        ],
                        const SliverToBoxAdapter(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 20),
                          child: Text('스킨케어', style: AppTextTheme.black20b),
                        )),
                        if (data['product'] != null &&
                            data['product'] != [] &&
                            data['product']?.isNotEmpty) ...[
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 0),
                            sliver: ProductSliverGridWidget(
                              products: data['product'] ?? [],
                            ),
                          )
                        ] else ...[
                          const SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 0),
                              child: Text('검색 결과가 없습니다.',
                                  style: AppTextTheme.grey14m),
                            ),
                          )
                        ],
                      ],
                      if (tabController.index == 1) ...[
                        const SliverToBoxAdapter(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 20),
                          child: Text('클리닉', style: AppTextTheme.black20b),
                        )),
                        if (data['clinic'] != null &&
                            data['clinic'] != [] &&
                            data['clinic']?.isNotEmpty) ...[
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 20),
                            sliver: ProductSliverGridWidget(
                              products: data['clinic'] ?? [],
                            ),
                          )
                        ] else ...[
                          const SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 0),
                              child: Text('검색 결과가 없습니다.',
                                  style: AppTextTheme.grey14m),
                            ),
                          )
                        ],
                      ],
                      if (tabController.index == 2) ...[
                        const SliverToBoxAdapter(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 20),
                          child: Text('스킨케어', style: AppTextTheme.black20b),
                        )),
                        if (data['product'] != null &&
                            data['product'] != [] &&
                            data['product']?.isNotEmpty) ...[
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 0),
                            sliver: ProductSliverGridWidget(
                              products: data['product'] ?? [],
                            ),
                          )
                        ] else ...[
                          const SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 0),
                              child: Text('검색 결과가 없습니다.',
                                  style: AppTextTheme.grey14m),
                            ),
                          )
                        ],
                      ],
                    ]
                  ]),
                )
              ],
            ),
          ),
        );
      },
      loading: () => const LoadingCircleAnimationWidget(),
      error: (e, s) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text('Error: $e, $s'),
        ),
      ),
    );
  }
}
