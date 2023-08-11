// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skincare_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SkincareCategoryModel _$$_SkincareCategoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_SkincareCategoryModel(
      id: json['id'] as int?,
      parentId: json['parentId'] as int?,
      name: json['name'] as String?,
      ranking: json['ranking'] as int?,
      description: json['description'] as String?,
      value: json['value'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$$_SkincareCategoryModelToJson(
        _$_SkincareCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'name': instance.name,
      'ranking': instance.ranking,
      'description': instance.description,
      'value': instance.value,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
    };
