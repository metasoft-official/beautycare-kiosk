import 'package:beauty_care/kiosk/repository/banner_kiosk_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KioskHomeState extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final BannerKioskRepository bannerKioskRepository;

  KioskHomeState(this.bannerKioskRepository)
      : super(const AsyncValue.loading()) {
    loadData();
  }

  Map<String, dynamic> data = {};

  // 배너 현재 인덱스
  int bannerCurIndex = 0;

  // 배너 슬라이드 컨트롤러
  // CarouselController crouselController = CarouselController();

  Future<void> loadData() async {
    try {
      await Future.wait([getBannerKioskList()]);
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  void reload() {
    state = AsyncValue.data(data);
  }

  Future<void> getBannerKioskList() async {
    final response = await bannerKioskRepository.getBannerKioskByQuery();
    if (response != null && response.items != null) {
      data['banner'] = response.items!;
    }
  }
}
