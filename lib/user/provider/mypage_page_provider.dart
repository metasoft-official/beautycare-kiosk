import 'package:beauty_care/user/provider/state/edit_state.dart';
import 'package:beauty_care/user/provider/state/my_page_change_state.dart';
import 'package:beauty_care/user/provider/state/my_page_data_state.dart';
import 'package:beauty_care/user/provider/user_disease_provider.dart';
import 'package:beauty_care/user/provider/user_skin_mbti_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mypageStateChangeProvider =
    AutoDisposeChangeNotifierProvider<MypageState>((ref) {
  return MypageState();
});

// SurveyState
final myPageStateProvider = AutoDisposeStateNotifierProvider<MyPageDataState,
    AsyncValue<Map<String, dynamic>>>(
  (ref) => MyPageDataState(
    ref,
    ref.read(userSkinMbtiRepositoryProvider),
    ref.read(userDiseaseRepositoryProvider),
  ),
);

final editStateProvider = ChangeNotifierProvider<EditState>((ref) {
  return EditState(ref);
});
