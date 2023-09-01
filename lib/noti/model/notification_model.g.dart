// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      id: json['id'] as int?,
      categoryCode: json['categoryCode'] as int?,
      sendDate: json['sendDate'] == null
          ? null
          : DateTime.parse(json['sendDate'] as String),
      targetCodeDepth1: json['targetCodeDepth1'] as int?,
      targetCodeDepth2: json['targetCodeDepth2'] as int?,
      targetUsername: json['targetUsername'] as String?,
      subject: json['subject'] as String?,
      content: json['content'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
      categoryName: json['categoryName'] as String?,
      targetDepth1Name: json['targetDepth1Name'] as String?,
      targetDepth2Name: json['targetDepth2Name'] as String?,
      topic: json['topic'] as String?,
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryCode': instance.categoryCode,
      'sendDate': datetimeToLocalDateTime(instance.sendDate),
      'targetCodeDepth1': instance.targetCodeDepth1,
      'targetCodeDepth2': instance.targetCodeDepth2,
      'targetUsername': instance.targetUsername,
      'subject': instance.subject,
      'content': instance.content,
      'createdDate': datetimeToLocalDateTime(instance.createdDate),
      'lastModifiedDate': datetimeToLocalDateTime(instance.lastModifiedDate),
      'categoryName': instance.categoryName,
      'targetDepth1Name': instance.targetDepth1Name,
      'targetDepth2Name': instance.targetDepth2Name,
      'topic': instance.topic,
    };
