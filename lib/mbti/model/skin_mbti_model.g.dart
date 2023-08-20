// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skin_mbti_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SkinMbtiModel _$$_SkinMbtiModelFromJson(Map<String, dynamic> json) =>
    _$_SkinMbtiModel(
      id: json['id'] as int?,
      skinMbtiName: json['skinMbtiName'] as String?,
      descriptionEng: json['descriptionEng'] as String?,
      subtitle: json['subtitle'] as String?,
      description: json['description'] as String?,
      skinTypeCode: json['skinTypeCode'] as int?,
      visibilityStatus: json['visibilityStatus'] as String?,
      createdTime: json['createdTime'] == null
          ? null
          : DateTime.parse(json['createdTime'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
      skinType: json['skinType'] as String?,
      skincareProductList: (json['skincareProductList'] as List<dynamic>?)
          ?.map((e) =>
              SkinMbtiSkincareProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      keywordList: (json['keywordList'] as List<dynamic>?)
          ?.map((e) => SkinMbtiKeywordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      caretipList: (json['caretipList'] as List<dynamic>?)
          ?.map((e) => SkinMbtiCaretipModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SkinMbtiModelToJson(_$_SkinMbtiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'skinMbtiName': instance.skinMbtiName,
      'descriptionEng': instance.descriptionEng,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'skinTypeCode': instance.skinTypeCode,
      'visibilityStatus': instance.visibilityStatus,
      'createdTime': instance.createdTime?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
      'skinType': instance.skinType,
      'skincareProductList': instance.skincareProductList,
      'keywordList': instance.keywordList,
      'caretipList': instance.caretipList,
    };
