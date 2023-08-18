import 'package:beauty_care/common/model/code_model.dart';
import 'package:beauty_care/common/repository/code_repository.dart';
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
}
