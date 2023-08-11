import 'package:beauty_care/common/dio/skin_category_api.dart';
import 'package:beauty_care/common/model/skincare_category_model.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/mbti/model/survey_question_model.dart';

class SkincareCategoryRepository {
  final SkinCategoryApi skincareCategoryApi;

  SkincareCategoryRepository(this.skincareCategoryApi);

  // 모든 카테고리
  Future<PageResponse<SkincareCategoryModel>?> getSkincareCategoryAll() async {
    try {
      final response = await skincareCategoryApi.getSkincareCategoryAll();
      logger.d(response);
      logger.d(response.rowSize);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // 종류 별 카테고리
  Future<PageResponse<SkincareCategoryModel>?> getSkincareCategoryByParentId(
      int parentId) async {
    final Map<String, dynamic> query = {'parentId': parentId, 'show': 'T'};
    try {
      final response =
          await skincareCategoryApi.getSkincareCategoryByParentId(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
