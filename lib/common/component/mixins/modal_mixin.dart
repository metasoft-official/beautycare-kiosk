import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/disease/model/disease_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tuple/tuple.dart';

import 'package:beauty_care/common/provider/modal/modal_grid_state_provider.dart';
import 'package:beauty_care/common/model/code_model.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';

class ModalMixin extends ChangeNotifier {
  static Future<int> filterModalBottomSheet(
      {required BuildContext context,
      String? title,
      required List<Object> list,
      required int selectedValue,
      required String modalKey}) async {
    String? type;
    String? name;
    List<CodeModel>? code;
    List<DiseaseModel>? disease;
    if (list is List<CodeModel>) {
      type = 'code';
      code = List.from(list);
    } else if (list is List<DiseaseModel>) {
      type = 'disease';
      disease = List.from(list);
    }

    return await showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 20,
        ),
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Consumer(
            builder: (context, ref, child) {
              final btnState = ref.watch(modalSelectProvider(
                      Tuple3(modalKey, selectedValue, list.length))
                  .notifier);
              final btnStateData = ref.watch(modalSelectProvider(
                  Tuple3(modalKey, selectedValue, list.length)));

              return list.isNotEmpty
                  ? Container(
                      height: 250,
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
                                if (title != null) ...[
                                  Text(
                                    title,
                                    style: AppTextTheme.black16b,
                                  ),
                                  const SizedBox(height: 16)
                                ],
                                LayoutGrid(
                                  columnGap: 12,
                                  rowGap: 12,
                                  columnSizes:
                                      list.length == 6 ? [1.fr, 1.fr] : [1.fr],
                                  rowSizes: list.length == 6
                                      ? List<TrackSize>.filled(
                                          (list.length / 2).ceil(), auto)
                                      : List<TrackSize>.filled(
                                          list.length, auto),
                                  children: List.generate(list.length, (index) {
                                    name = type?.contains('disease') == true
                                        ? disease![index].name
                                        : code![index].name;
                                    return SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          btnState.selectButton(
                                              modalKey, index);
                                          context.pop(index);
                                        },
                                        style: btnStateData.modals[modalKey]
                                                    ?.curIndex ==
                                                index
                                            ? AppButtonTheme
                                                .basicElevatedButtonTheme
                                            : AppButtonTheme
                                                .outlinedBasicButtonTheme,
                                        child: Text(
                                          name ?? '-',
                                          style: btnStateData.modals[modalKey]
                                                      ?.curIndex ==
                                                  index
                                              ? AppTextTheme.white16m
                                              : AppTextTheme.blue16m,
                                        ),
                                      ),
                                    );
                                  }),
                                )
                              ],
                            ))
                          : CustomScrollView(slivers: [
                              SliverToBoxAdapter(
                                child: Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          border: AppBoxTheme
                                              .outlinedBlueinputBorderTheme),
                                    )),
                              ),
                              SliverGrid(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 3,
                                ),
                                delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                  name = type?.contains('disease') == true
                                      ? disease![index].name
                                      : code![index].name;
                                  return ElevatedButton(
                                    onPressed: () {
                                      btnState.selectButton(modalKey, index);
                                      context.pop(index);
                                    },
                                    style: btnStateData
                                                .modals[modalKey]?.curIndex ==
                                            index
                                        ? AppButtonTheme
                                            .basicElevatedButtonTheme
                                        : AppButtonTheme
                                            .outlinedBasicButtonTheme,
                                    child: Text(
                                      name ?? '-',
                                      style: btnStateData
                                                  .modals[modalKey]?.curIndex ==
                                              index
                                          ? AppTextTheme.white16m
                                          : AppTextTheme.blue16m,
                                    ),
                                  );
                                }, childCount: list.length),
                              )
                            ]),
                    )
                  : Container();
            },
          );
        });
  }
}
