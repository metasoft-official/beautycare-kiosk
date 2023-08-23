import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/user/model/form_state_model.dart';
import 'package:beauty_care/user/provider/state/address_change_state.dart';
import 'package:beauty_care/user/provider/state/dropdown_change_state.dart';
import 'package:beauty_care/user/provider/state/form_state.dart';
import 'package:beauty_care/user/provider/state/register_data_state.dart';
import 'package:beauty_care/user/provider/state/terms_change_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 데이터 state
final registerDataStateProvider =
    StateNotifierProvider<RegisterDataState, AsyncValue<Map<String, dynamic>>>(
        (ref) => RegisterDataState(ref, ref.read(userRepositoryProvider)));

// 약관 동의
final termsChangeStateProvider =
    ChangeNotifierProvider<TermsChangeState>((ref) {
  return TermsChangeState();
});

// 드롭 다운
final dropdownChangeStateProvider =
    ChangeNotifierProvider<DropdownChangeState>((ref) {
  return DropdownChangeState();
});

// 드롭 다운
final addressChangeStateProvider =
    ChangeNotifierProvider<AddressChangeState>((ref) {
  return AddressChangeState();
});

// 폼 데이터
final formStateProvider = StateNotifierProvider<FormNotifier, FormStateModel>(
    (ref) => FormNotifier(ref));
