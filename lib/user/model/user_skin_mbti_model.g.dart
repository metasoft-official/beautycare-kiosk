// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_skin_mbti_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSkinMbtiModel _$$_UserSkinMbtiModelFromJson(Map<String, dynamic> json) =>
    _$_UserSkinMbtiModel(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      surveyId: json['surveyId'] as int?,
      skinMbtiId: json['skinMbtiId'] as int?,
      category1Score: (json['category1Score'] as num?)?.toDouble(),
      category1Type: json['category1Type'] as String?,
      category2Score: (json['category2Score'] as num?)?.toDouble(),
      category2Type: json['category2Type'] as String?,
      category3Score: (json['category3Score'] as num?)?.toDouble(),
      category3Type: json['category3Type'] as String?,
      category4Score: (json['category4Score'] as num?)?.toDouble(),
      category4Type: json['category4Type'] as String?,
      createdTime: json['createdTime'] == null
          ? null
          : DateTime.parse(json['createdTime'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
      skinMbtiName: json['skinMbtiName'] as String?,
      descriptionEng: json['descriptionEng'] as String?,
    );

Map<String, dynamic> _$$_UserSkinMbtiModelToJson(
        _$_UserSkinMbtiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'surveyId': instance.surveyId,
      'skinMbtiId': instance.skinMbtiId,
      'category1Score': instance.category1Score,
      'category1Type': instance.category1Type,
      'category2Score': instance.category2Score,
      'category2Type': instance.category2Type,
      'category3Score': instance.category3Score,
      'category3Type': instance.category3Type,
      'category4Score': instance.category4Score,
      'category4Type': instance.category4Type,
      'createdTime': instance.createdTime?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
      'skinMbtiName': instance.skinMbtiName,
      'descriptionEng': instance.descriptionEng,
    };
