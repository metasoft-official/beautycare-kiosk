// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_trend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchTrendModel _$$_SearchTrendModelFromJson(Map<String, dynamic> json) =>
    _$_SearchTrendModel(
      id: json['id'] as int?,
      searchKeyword: json['searchKeyword'] as String?,
      visibilityStatus: json['visibilityStatus'] as String?,
      title: json['title'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$$_SearchTrendModelToJson(_$_SearchTrendModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'searchKeyword': instance.searchKeyword,
      'visibilityStatus': instance.visibilityStatus,
      'title': instance.title,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
    };
