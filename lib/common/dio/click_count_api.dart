import 'package:beauty_care/common/const/values.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'click_count_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class ClickCountApi {
  factory ClickCountApi(Dio dio, {String baseUrl}) = _ClickCountApi;

  @PUT('/common/click-counts/update-click-count/{itemId}')
  Future<int> updateClickCount(
      @Path('itemId') int itemId, @Body() Map<String, dynamic> body);
}
