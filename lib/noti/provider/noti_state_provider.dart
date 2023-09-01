import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/notification_api.dart';
import 'package:beauty_care/noti/model/notification_model.dart';
import 'package:beauty_care/noti/repository/notification_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Api 인스턴스를 생성하는 Provider
final notificationApiProvider = Provider<NotificationApi>((ref) {
  final dio = ref.read(dioProvider);
  return NotificationApi(dio);
});

// Repository 인스턴스를 생성하는 Provider
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  final notificationApi = ref.read(notificationApiProvider);
  return NotificationRepository(notificationApi);
});
final notiStateProvider = ChangeNotifierProvider<NotiState>((ref) {
  return NotiState();
});

final notiDataProvider = AutoDisposeStateNotifierProvider<NotiDataState,
    AsyncValue<List<NotificationModel>>>((ref) {
  return NotiDataState(ref, ref.read(notificationRepositoryProvider));
});

class NotiState extends ChangeNotifier {
  NotiState() {}
  //
  // void checkNoti(int index) {
  //   if (isCheckedNoti[index] == false) isCheckedNoti[index] = true;
  //   resetState();
  //   notifyListeners();
  // }

  void resetState() {
    NotiState();
    notifyListeners();
  }
}

class NotiDataState extends StateNotifier<AsyncValue<List<NotificationModel>>> {
  final Ref ref;
  final NotificationRepository notificationRepository;

  NotiDataState(this.ref, this.notificationRepository)
      : super(const AsyncValue.loading()) {
    loadData();
  }

  List<NotificationModel> data = [];

  Future<void> loadData() async {
    try {
      await Future.wait([getNotificationList()]);
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> getNotificationList() async {
    // final response = await notificationRepository.getNotificationByQuery();
    final response = await notificationRepository.getNotificationAll();
    if (response != null && response.items != null) {
      data = response.items!;
    } else {
      data = [];
    }
  }
}
