import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

String? datetimeToLocalDateTime(DateTime? value) {
  if (value == null) {
    return null;
  } else {
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(value);
  }
}

@freezed
class NotificationModel with _$NotificationModel {
  factory NotificationModel(
      {int? id,
      int? categoryCode,
      @JsonKey(toJson: datetimeToLocalDateTime) DateTime? sendDate,
      int? targetCodeDepth1,
      int? targetCodeDepth2,
      String? targetUsername,
      String? subject,
      String? content,
      @JsonKey(toJson: datetimeToLocalDateTime) DateTime? createdDate,
      @JsonKey(toJson: datetimeToLocalDateTime) DateTime? lastModifiedDate,
      String? categoryName,
      String? targetDepth1Name,
      String? targetDepth2Name,
      String? topic}) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
