// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoleUserModel _$$_RoleUserModelFromJson(Map<String, dynamic> json) =>
    _$_RoleUserModel(
      id: json['id'] as int?,
      roleId: json['roleId'] as int?,
      userId: json['userId'] as int?,
      role: json['role'] == null
          ? null
          : RoleModel.fromJson(json['role'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RoleUserModelToJson(_$_RoleUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roleId': instance.roleId,
      'userId': instance.userId,
      'role': instance.role,
      'user': instance.user,
    };
