import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/banner_kiosk_api.dart';
import 'package:beauty_care/kiosk/provider/state/kiosk_home_state.dart';
import 'package:beauty_care/kiosk/repository/banner_kiosk_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bannerKioskApiProvider = Provider<BannerKioskApi>((ref) {
  final dio = ref.read(dioProvider);
  return BannerKioskApi(dio);
});

final bannerKioskRepositoryProvider = Provider<BannerKioskRepository>((ref) {
  final bannerKioskApi = ref.read(bannerKioskApiProvider);
  return BannerKioskRepository(bannerKioskApi);
});

final kioskHomeProvider = AutoDisposeStateNotifierProvider<KioskHomeState,
        AsyncValue<Map<String, dynamic>>>(
    (ref) => KioskHomeState(ref.read(bannerKioskRepositoryProvider)));
