import 'package:beauty_care/common/dio/notification_api.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/noti/model/notification_model.dart';

class NotificationRepository {
  final NotificationApi notificationApi;

  NotificationRepository(this.notificationApi);

  // all
  Future<PageResponse<NotificationModel>?> getNotificationAll() async {
    try {
      final response = await notificationApi.getNotificationListAll();
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // by query
  Future<PageResponse<NotificationModel>?> getNotificationByQuery() async {
    // Todo 모바일 키오스크 전용 알림도 체크 필요
    final Map<String, dynamic> query = {
      'param': {'visibilityStatus': 'A'},
      'pageRequest': {'rowSize': 200}
    };
    try {
      final response =
          await notificationApi.getNotificationListByParentId(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
