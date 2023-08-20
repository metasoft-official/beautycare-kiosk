import 'package:beauty_care/common/dio/promotion_api.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/promotion/model/promotion_model.dart';

class PromotionRepository {
  final PromotionApi promotionApi;

  PromotionRepository(this.promotionApi);

  // 모두 가져오기
  Future<PageResponse<PromotionModel>?> getPromotionAll() async {
    try {
      final response = await promotionApi.getPromotionAll();
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // 특정 리스트 가져오기
  Future<PageResponse<PromotionModel>?> getPromotionListByQuery(
      PromotionModel promotionModel) async {
    final Map<String, dynamic> query = {...promotionModel.toJson()};
    try {
      final response = await promotionApi.getPromotionListByQuery(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
