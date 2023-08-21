import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:beauty_care/clinic/model/clinic_model.dart';
import 'package:beauty_care/clinic/provider/clinic_state_provider.dart';
import 'package:beauty_care/mbti/model/skin_mbti_model.dart';
import 'package:beauty_care/mbti/repository/skin_mbti_repository.dart';
import 'package:beauty_care/user/model/user_skin_mbti_model.dart';
import 'package:beauty_care/user/provider/user_skin_mbti_provider.dart';

import '../../../main.dart';

class MbtiResultDataState
    extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final Ref ref;
  final SkinMbtiRepository skinMbtiRepository;
  final int id;

  MbtiResultDataState(this.ref, this.skinMbtiRepository, this.id)
      : super(const AsyncValue.loading()) {
    loadData();
  }

  Map<String, dynamic> data = {};
  Map<String, dynamic> subtitle = {};

  Future<void> loadData() async {
    try {
      await Future.wait([
        getMbtiResult(),
      ]);
      await Future.wait([
        getMbtiTypeInfo(data['result'].skinMbtiId),
      ]);
      subtitle = splitMarkText(data['typeInfo'].subtitle ?? '-');
      data['subtitle'] = subtitle;
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> getMbtiResult() async {
    final userSkinMbtiRepository = ref.read(userSkinMbtiRepositoryProvider);
    final userResponse = await userSkinMbtiRepository.getUserSkinMbtiById(id);
    if (userResponse != null) {
      data['result'] = userResponse;
    } else {
      data['result'] = [];
    }
  }

  Future<void> getMbtiTypeInfo(int? id) async {
    final response = await skinMbtiRepository
        .getSkinMbtiById(id ?? data['result'].skinMbtiId ?? -1);
    if (response != null) {
      data['typeInfo'] = response;
    } else {
      data['typeInfo'] = [];
    }
  }

  Map<String, String> splitMarkText(String text) {
    List<String> splitTexts = text.split(' ');
    int i = text.indexOf(splitTexts[splitTexts.length - 1]);

    String markText = splitTexts[(splitTexts.length - 1)];
    String exceptText = text.substring(0, i);

    return {'exceptText': exceptText, 'markText': markText};
  }

  void reload() {
    state = AsyncValue.data(data);
  }
}
