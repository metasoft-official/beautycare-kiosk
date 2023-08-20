import 'package:beauty_care/common/dio/region_api.dart';
import 'package:beauty_care/common/model/region_model.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/model/page_response_model.dart';

class RegionRepository {
  final RegionApi regionApi;

  RegionRepository(this.regionApi);

  // 모든 코드
  Future<PageResponse<RegionModel>?> getRegionAll() async {
    try {
      final response = await regionApi.getRegionAll();
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
