// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      username: json['username'] as int?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      zipCode: json['zipCode'] as String?,
      address1: json['address1'] as String?,
      address2: json['address2'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      joinDate: json['joinDate'] == null
          ? null
          : DateTime.parse(json['joinDate'] as String),
      agreeReceiveSmsDate: json['agreeReceiveSmsDate'] == null
          ? null
          : DateTime.parse(json['agreeReceiveSmsDate'] as String),
      agreeReceiveEmailDate: json['agreeReceiveEmailDate'] == null
          ? null
          : DateTime.parse(json['agreeReceiveEmailDate'] as String),
      maritalStatus: json['maritalStatus'] as String?,
      age: json['age'] as int?,
      cumulativeNumberOrders: json['cumulativeNumberOrders'] as int?,
      unavailableReserves: json['unavailableReserves'] as int?,
      availableReserves: json['availableReserves'] as int?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      gender: json['gender'] as String?,
      actualPaymentAmount: json['actualPaymentAmount'] as int?,
      nameAuthenticationStatus: json['nameAuthenticationStatus'] as String?,
      solarCalendarStatus: json['solarCalendarStatus'] as String?,
      area: json['area'] as String?,
      totalVisit: json['totalVisit'] as int?,
      totalReserveUse: json['totalReserveUse'] as int?,
      totalActualOrders: json['totalActualOrders'] as int?,
      totalOrderAmount: json['totalOrderAmount'] as int?,
      totalDeposit: json['totalDeposit'] as int?,
      totalReserve: json['totalReserve'] as int?,
      lastAccessDate: json['lastAccessDate'] == null
          ? null
          : DateTime.parse(json['lastAccessDate'] as String),
      lastOrderDate: json['lastOrderDate'] == null
          ? null
          : DateTime.parse(json['lastOrderDate'] as String),
      finalEducationCode: json['finalEducationCode'] as int?,
      joinPathCode: json['joinPathCode'] as int?,
      userTypeCode: json['userTypeCode'] as int?,
      userGradeCode: json['userGradeCode'] as int?,
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
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'zipCode': instance.zipCode,
      'address1': instance.address1,
      'address2': instance.address2,
      'phoneNumber': instance.phoneNumber,
      'joinDate': instance.joinDate?.toIso8601String(),
      'agreeReceiveSmsDate': instance.agreeReceiveSmsDate?.toIso8601String(),
      'agreeReceiveEmailDate':
          instance.agreeReceiveEmailDate?.toIso8601String(),
      'maritalStatus': instance.maritalStatus,
      'age': instance.age,
      'cumulativeNumberOrders': instance.cumulativeNumberOrders,
      'unavailableReserves': instance.unavailableReserves,
      'availableReserves': instance.availableReserves,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': instance.gender,
      'actualPaymentAmount': instance.actualPaymentAmount,
      'nameAuthenticationStatus': instance.nameAuthenticationStatus,
      'solarCalendarStatus': instance.solarCalendarStatus,
      'area': instance.area,
      'totalVisit': instance.totalVisit,
      'totalReserveUse': instance.totalReserveUse,
      'totalActualOrders': instance.totalActualOrders,
      'totalOrderAmount': instance.totalOrderAmount,
      'totalDeposit': instance.totalDeposit,
      'totalReserve': instance.totalReserve,
      'lastAccessDate': instance.lastAccessDate?.toIso8601String(),
      'lastOrderDate': instance.lastOrderDate?.toIso8601String(),
      'finalEducationCode': instance.finalEducationCode,
      'joinPathCode': instance.joinPathCode,
      'userTypeCode': instance.userTypeCode,
      'userGradeCode': instance.userGradeCode,
      'mobileNumber': instance.mobileNumber,
      'lastModifiedPasswordDate':
          instance.lastModifiedPasswordDate?.toIso8601String(),
      'status': instance.status,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
    };
