import 'package:beauty_care/common/dio/oxy_facial_api.dart';
import 'package:beauty_care/oxyfacial/provider/state/oxy_facial_data_state.dart';
import 'package:beauty_care/oxyfacial/repository/oxy_facial_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/const/values.dart';

// Api 인스턴스를 생성하는 Provider
final oxyFacialApiProvider = Provider<OxyFacialApi>((ref) {
  final dio = ref.read(dioProvider);
  return OxyFacialApi(dio);
});

// Repository 인스턴스를 생성하는 Provider
final oxyFacialRepositoryProvider = Provider<OxyFacialRepository>((ref) {
  final oxyFacialApi = ref.read(oxyFacialApiProvider);
  return OxyFacialRepository(oxyFacialApi);
});

final oxyFacialStateProvider =
    StateNotifierProvider<OxyFacialDataState, AsyncValue<Map<String, dynamic>>>(
        (ref) {
  return OxyFacialDataState(ref, ref.read(oxyFacialRepositoryProvider));
});

class OxyfacialState extends ChangeNotifier {
  void resetState() {
    OxyfacialState();
    notifyListeners();
  }
}
