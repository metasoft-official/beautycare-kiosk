// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoleModel _$$_RoleModelFromJson(Map<String, dynamic> json) => _$_RoleModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      roleTypeCode: json['roleTypeCode'] as int?,
      roleDetailTypeCode: json['roleDetailTypeCode'] as int?,
      description: json['description'] as String?,
      value: json['value'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$$_RoleModelToJson(_$_RoleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'roleTypeCode': instance.roleTypeCode,
      'roleDetailTypeCode': instance.roleDetailTypeCode,
      'description': instance.description,
      'value': instance.value,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
    };
