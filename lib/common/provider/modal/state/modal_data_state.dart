import 'package:beauty_care/common/model/code_model.dart';
import 'package:beauty_care/common/repository/code_repository.dart';
import 'package:beauty_care/disease/model/disease_model.dart';
import 'package:beauty_care/disease/provider/disease_state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModalDataState extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final Ref ref;
  final CodeRepository codeRepository;

  ModalDataState(this.ref, this.codeRepository)
      : super(const AsyncValue.loading());

  Map<String, dynamic> data = {};

  Future<List<CodeModel>?> getOrderList(
      {required String modalKey, required int parentId, int? curIndex}) async {
    final orderData = await codeRepository.getCodeListByParentId(parentId);
    if (orderData != null && orderData.items != null) {
      data[modalKey] = orderData.items;

      return data[modalKey];
    }
    return null;
  }

  Future<List<DiseaseModel>?> getDiseaseList(String modalKey) async {
    final diseaseRepository = ref.read(diseaseRepositoryProvider);
    final response = await diseaseRepository.getDiseaseByQuery(DiseaseModel());
    if (response != null && response.items != null) {
      data[modalKey] = response.items;

      return data[modalKey];
    }
    return null;
  }
}
