// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_disease_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDieseaseModel _$$_UserDieseaseModelFromJson(Map<String, dynamic> json) =>
    _$_UserDieseaseModel(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      topk1Label: json['topk1Label'] as String?,
      topk1Value: (json['topk1Value'] as num?)?.toDouble(),
      topk1Id: json['topk1Id'] as int?,
      topk2Label: json['topk2Label'] as String?,
      topk2Value: (json['topk2Value'] as num?)?.toDouble(),
      topk2Id: json['topk2Id'] as int?,
      topk3Label: json['topk3Label'] as String?,
      topk3Value: (json['topk3Value'] as num?)?.toDouble(),
      topk3Id: json['topk3Id'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$$_UserDieseaseModelToJson(
        _$_UserDieseaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'topk1Label': instance.topk1Label,
      'topk1Value': instance.topk1Value,
      'topk1Id': instance.topk1Id,
      'topk2Label': instance.topk2Label,
      'topk2Value': instance.topk2Value,
      'topk2Id': instance.topk2Id,
      'topk3Label': instance.topk3Label,
      'topk3Value': instance.topk3Value,
      'topk3Id': instance.topk3Id,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
    };
