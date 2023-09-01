import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/noti/model/notification_model.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'notification_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class NotificationApi {
  factory NotificationApi(Dio dio, {String baseUrl}) = _NotificationApi;

  @GET('/common/notifications')
  Future<PageResponse<NotificationModel>> getNotificationListAll();

  @GET('/common/notifications')
  Future<PageResponse<NotificationModel>> getNotificationListByParentId(
      @Queries() Map<String, dynamic> query);
}
