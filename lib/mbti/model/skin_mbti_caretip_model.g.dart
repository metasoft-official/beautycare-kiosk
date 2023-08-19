// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skin_mbti_caretip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SkinMbtiCaretipModel _$$_SkinMbtiCaretipModelFromJson(
        Map<String, dynamic> json) =>
    _$_SkinMbtiCaretipModel(
      id: json['id'] as int?,
      skinMbtiId: json['skinMbtiId'] as int?,
      content: json['content'] as String?,
      sortOrder: json['sortOrder'] as int?,
      createdTime: json['createdTime'] == null
          ? null
          : DateTime.parse(json['createdTime'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$$_SkinMbtiCaretipModelToJson(
        _$_SkinMbtiCaretipModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'skinMbtiId': instance.skinMbtiId,
      'content': instance.content,
      'sortOrder': instance.sortOrder,
      'createdTime': instance.createdTime?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
    };
