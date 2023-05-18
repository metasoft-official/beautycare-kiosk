// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthenticationModel _$$_AuthenticationModelFromJson(
        Map<String, dynamic> json) =>
    _$_AuthenticationModel(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      name: json['name'] as String?,
      username: json['username'] as int?,
    );

Map<String, dynamic> _$$_AuthenticationModelToJson(
        _$_AuthenticationModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'name': instance.name,
      'username': instance.username,
    };
