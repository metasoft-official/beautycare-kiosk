// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CodeModel _$$_CodeModelFromJson(Map<String, dynamic> json) => _$_CodeModel(
      id: json['id'] as int?,
      parentId: json['parentId'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      value: json['value'] as String?,
      orderNo: json['orderNo'] as int?,
      status: json['status'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$$_CodeModelToJson(_$_CodeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'name': instance.name,
      'description': instance.description,
      'value': instance.value,
      'orderNo': instance.orderNo,
      'status': instance.status,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
    };
