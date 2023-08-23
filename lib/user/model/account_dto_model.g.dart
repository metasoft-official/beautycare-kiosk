// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountDtoModel _$$_AccountDtoModelFromJson(Map<String, dynamic> json) =>
    _$_AccountDtoModel(
      roleId: json['roleId'] as int?,
      userId: json['userId'] as int?,
      userDto: json['userDto'] == null
          ? null
          : UserModel.fromJson(json['userDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AccountDtoModelToJson(_$_AccountDtoModel instance) =>
    <String, dynamic>{
      'roleId': instance.roleId,
      'userId': instance.userId,
      'userDto': instance.userDto,
    };
