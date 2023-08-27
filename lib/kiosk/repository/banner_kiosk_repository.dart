import 'package:beauty_care/common/dio/banner_kiosk_api.dart';
import 'package:beauty_care/kiosk/model/banner_kiosk_model.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/model/page_response_model.dart';

class BannerKioskRepository {
  final BannerKioskApi bannerKioskApi;

  BannerKioskRepository(this.bannerKioskApi);

  // all
  Future<PageResponse<BannerKioskModel>?> getBannerKioskAll() async {
    try {
      final response = await bannerKioskApi.getBannerKioskAll();
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // by query
  Future<PageResponse<BannerKioskModel>?> getBannerKioskByQuery() async {
    final Map<String, dynamic> query = {'visibilityStatus': 'T'};
    try {
      final response = await bannerKioskApi.getBannerKioskByQuery(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
