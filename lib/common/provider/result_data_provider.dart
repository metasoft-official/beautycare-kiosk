import 'package:beauty_care/common/model/user_model.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/mbti/model/skin_mbti_keyword_model.dart';
import 'package:beauty_care/mbti/model/skin_mbti_model.dart';
import 'package:beauty_care/mbti/provider/mbti_result_state_provider.dart';
import 'package:beauty_care/user/model/user_disease_model.dart';
import 'package:beauty_care/user/model/user_skin_mbti_model.dart';
import 'package:beauty_care/user/provider/user_disease_provider.dart';
import 'package:beauty_care/user/provider/user_skin_mbti_provider.dart';
import 'package:beauty_care/user/repository/user_disease_repository.dart';
import 'package:beauty_care/user/repository/user_skin_mbti_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../main.dart';

final resultStateProvider =
    StateNotifierProvider<ResultDataState, AsyncValue<Map<String, dynamic>>>(
        (ref) {
  final user = ref.watch(userNotifierProvider);
  return ResultDataState(ref, ref.read(userSkinMbtiRepositoryProvider),
      ref.read(userDiseaseRepositoryProvider),
      user: user);
});

class ResultDataState extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final Ref ref;
  final UserSkinMbtiRepository userSkinMbtiRepository;
  final UserDiseaseRepository userDiseaseRepository;
  final UserModel? user;

  ResultDataState(
      this.ref, this.userSkinMbtiRepository, this.userDiseaseRepository,
      {this.user})
      : super(const AsyncValue.loading()) {
    loadData();
  }

  Map<String, dynamic> data = {};

  Future<void> loadData() async {
    logger.d('load & userId : ${user?.id}');
    try {
      await Future.wait([
        getMbtiResult(user?.id ?? -1),
        getDiseaseResult(user?.id ?? -1),
      ]);
      await getMbtiTypeInfo(data['mbti']?.skinMbtiId);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> getMbtiResult(int? userId) async {
    final userResponse = userId != null
        ? await userSkinMbtiRepository.getUserSkinMbtiByQuery(userId: userId)
        : null;
    if (userResponse != null && userResponse.items != null) {
      UserSkinMbtiModel mbti = userResponse.items!.last;
      data['mbti'] = mbti;
    } else {
      data['mbti'] = null;
    }
  }

  Future<void> getMbtiTypeInfo(int? mbtiId) async {
    SkinMbtiModel? mbtiInfo;
    final response =
        await ref.read(skinMbtiApiProvider).getSkinMbtiById(mbtiId ?? -1);
    mbtiInfo = response.copyWith();
    data['mbtiInfo'] = mbtiInfo;
    state = AsyncValue.data(data);
  }

  Future<void> getDiseaseResult(int? userId) async {
    final userResponse =
        await userDiseaseRepository.getUserDiseaseByQuery(userId ?? -1);
    if (userResponse != null && userResponse.items != null) {
      List<UserDiseaseModel> disease = List.from(userResponse.items!);
      data['disease'] = disease;
    } else {
      data['disease'] = null;
    }
  }

  Future<void> getSortedAll() async {
    List<dynamic> mergedList = [];
    data.forEach((key, value) {
      if (!key.contains('mbti') && !key.contains('disease')) {
        return;
      }
      mergedList.addAll(value);
    });
    mergedList.sort((a, b) => a.createdDate.compareTo(b.createdDate));

    data['allResult'] = mergedList;
  }

  void reload() {
    state = AsyncValue.data(data);
  }
}
