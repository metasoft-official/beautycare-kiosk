import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';

class ModalMixin extends ChangeNotifier {
  static void filterModalBottomSheet(context, title, list) {
    int selectedIndex = 0;

    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        constraints: BoxConstraints(
          // maxHeight: 300,
          maxWidth: MediaQuery.of(context).size.width - 20,
        ),
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: 243,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            margin: const EdgeInsets.only(bottom: 18),
            padding: const EdgeInsets.all(20),
            child: list.length <= 6
                ? SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTextTheme.black16b,
                          ),
                          const SizedBox(height: 16),
                          if (list.length <= 5) ...[
                            Expanded(
                              child: Row(
                                children: List.generate(list.length, (index) {
                                  return SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        selectedIndex = index;
                                      },
                                      style: AppButtonTheme
                                          .outlinedBasicButtonTheme,
                                      child: Text(
                                        list[index],
                                        style: AppTextTheme.blue16m,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            )
                          ] else ...[
                            LayoutGrid(
                              columnGap: 12,
                              rowGap: 12,
                              columnSizes: [1.fr, 1.fr],
                              rowSizes: List<TrackSize>.filled(
                                  (list.length / 2).ceil(), auto),
                              children: List.generate(list.length, (index) {
                                return SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      selectedIndex = index;
                                    },
                                    style: selectedIndex == index
                                        ? AppButtonTheme
                                            .outlinedBasicButtonTheme
                                        : AppButtonTheme
                                            .basicElevatedButtonTheme,
                                    child: Text(
                                      list[index],
                                      style: AppTextTheme.blue16m,
                                    ),
                                  ),
                                );
                              }),
                            )
                          ],
                        ]),
                  )
                : CustomScrollView(slivers: [
                    SliverToBoxAdapter(
                      child: TextFormField(),
                    ),
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.5,
                      ),
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return ElevatedButton(
                          onPressed: () {
                            selectedIndex = index;
                          },
                          style: AppButtonTheme.outlinedBasicButtonTheme,
                          child: Text(
                            list[index],
                            style: AppTextTheme.blue16m,
                          ),
                        );
                      }),
                    )
                  ]),
          );
        });
  }
}
