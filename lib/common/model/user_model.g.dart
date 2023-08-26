// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      zipCode: json['zipCode'] as String?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      joinDate: json['joinDate'] == null
          ? null
          : DateTime.parse(json['joinDate'] as String),
      age: json['age'] as int?,
      birthDate: json['birthDate'],
      gender: json['gender'] as String?,
      lastAccessDate: json['lastAccessDate'] == null
          ? null
          : DateTime.parse(json['lastAccessDate'] as String),
      mobileNumber: json['mobileNumber'] as String?,
      lastModifiedPasswordDate: json['lastModifiedPasswordDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedPasswordDate'] as String),
      status: json['status'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
      socialLoginId: json['socialLoginId'] as String?,
      socialLoginType: json['socialLoginType'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': intToString(instance.id),
      'name': instance.name,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'zipCode': instance.zipCode,
      'address1': instance.address1,
      'address2': instance.address2,
      'phoneNumber': instance.phoneNumber,
      'joinDate': instance.joinDate?.toIso8601String(),
      'age': intToString(instance.age),
      'birthDate': datetimeToLocalDateTime(instance.birthDate),
      'gender': instance.gender,
      'lastAccessDate': instance.lastAccessDate?.toIso8601String(),
      'mobileNumber': instance.mobileNumber,
      'lastModifiedPasswordDate':
          instance.lastModifiedPasswordDate?.toIso8601String(),
      'status': instance.status,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
      'socialLoginId': instance.socialLoginId,
      'socialLoginType': instance.socialLoginType,
    };
