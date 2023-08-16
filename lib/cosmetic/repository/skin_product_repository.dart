import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/dio/skin_product_api.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/cosmetic/model/skin_product_model.dart';

class SkinProductRepository {
  final SkinProductApi skinProductApi;

  SkinProductRepository(this.skinProductApi);

  // 모든 제품 가져오기
  Future<PageResponse<SkinProductModel>?> getSkinProductAll() async {
    try {
      final response = await skinProductApi.getSkinProductAll();
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // 특정 값 제품 가져오기
  Future<PageResponse<SkinProductModel>?> getSkinProductByQuery(
      SkinProductModel skinProductModel) async {
    final Map<String, dynamic> query = {...skinProductModel.toJson()};
    try {
      final response = await skinProductApi.getSkinProductByQuery(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
