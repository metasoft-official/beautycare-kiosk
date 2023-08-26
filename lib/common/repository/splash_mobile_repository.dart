import 'package:beauty_care/common/dio/skin_category_api.dart';
import 'package:beauty_care/common/dio/splash_mobile_api.dart';
import 'package:beauty_care/common/model/skincare_category_model.dart';
import 'package:beauty_care/common/model/splash_mobile_model.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/mbti/model/survey_question_model.dart';

class SplashMobileRepository {
  final SplashMobileApi splashMobileApi;

  SplashMobileRepository(this.splashMobileApi);

  // all
  Future<PageResponse<SplashMobileModel>?> getSplashMobileAll() async {
    try {
      final response = await splashMobileApi.getSplashMobileAll();
      logger.d(response);
      logger.d(response.rowSize);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // by query
  Future<PageResponse<SplashMobileModel>?> getSplashMobileByQuery() async {
    final Map<String, dynamic> query = {'visibilityStatus': 'T'};
    try {
      final response = await splashMobileApi.getSplashMobileByQuery(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
