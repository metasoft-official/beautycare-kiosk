import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/user/model/user_disease_model.dart';
import 'package:beauty_care/user/repository/user_disease_repository.dart';
import 'package:beauty_care/user/repository/user_skin_mbti_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:beauty_care/user/model/user_skin_mbti_model.dart';

import '../../../main.dart';

class MyPageDataState extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final Ref ref;
  final UserSkinMbtiRepository userSkinMbtiRepository;
  final UserDiseaseRepository userDiseaseRepository;

  MyPageDataState(
      this.ref, this.userSkinMbtiRepository, this.userDiseaseRepository)
      : super(const AsyncValue.loading()) {
    loadData();
  }

  Map<String, dynamic> data = {};
  Map<String, dynamic> subtitle = {};

  Future<void> loadData() async {
    try {
      final user = ref.read(userNotifierProvider.notifier).user;
      await Future.wait([
        getMbtiResult(user.id),
        getDiseaseResult(user.id),
      ]);
      await Future.wait([getSortedAll()]);
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> getMbtiResult(int? userId) async {
    UserSkinMbtiModel userSkinMbtiModel =
        UserSkinMbtiModel(userId: userId ?? -1);
    final userResponse =
        await userSkinMbtiRepository.getUserSkinMbtiByQuery(userSkinMbtiModel);
    if (userResponse != null && userResponse.items != null) {
      data['mbti'] = List.from(userResponse.items!);
    } else {
      data['mbti'] = [];
    }
  }

  Future<void> getDiseaseResult(int? userId) async {
    UserDiseaseModel userDiseaseModel = UserDiseaseModel(userId: userId ?? -1);
    final userResponse =
        await userDiseaseRepository.getUserDiseaseByQuery(userDiseaseModel);
    // await userDiseaseRepository.getUserDiseaseAll();
    if (userResponse != null && userResponse.items != null) {
      data['disease'] = List.from(userResponse.items!);
    } else {
      data['disease'] = [];
    }
  }

  Future<void> getSortedAll() async {
    List<dynamic> mergedList = [];
    data.forEach((key, value) {
      mergedList.addAll(value);
    });
    mergedList.sort((a, b) => a.createdDate.compareTo(b.createdDate));

    data['allResult'] = mergedList;
  }

  void reload() {
    state = AsyncValue.data(data);
  }
}
