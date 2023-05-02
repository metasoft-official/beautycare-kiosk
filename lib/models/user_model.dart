import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String username,
    required String password,
    // int id,
    // String name,
    // String email,
    // String zipCode,
    // String address1,
    // String address2,
    // String phoneNumber,
    // DateTime joinDate,
    // DateTime agreeReceiveSmsDate,
    // DateTime agreeRecieveEmailDate,
    // String maritalStatus,
    // int age,
    // int cumulativeNumberOrders,
    // int unavailableReserves,
    // int availableReserves,
    // DateTime birthDate,
    // String gender,
    // int actualPaymentAmount,
    // String nameAuthenticationStatus,
    // String solarCalendarStatus,
    // String area,
    // int totalVisit,
    // int totalReserveUse,
    // int totalActualOrders,
    // int totalDeposit,
    // int totalReserve,
    // DateTime lastAccessDate,
    // DateTime lastOrderDate,
    // int finalEducation,
    // int joinPath,
    // int userType,
    // int userGrade,
    // String mobileNumber
  }) = _User;

  factory User.fromJson(Map<String, Object?> json)
    => _$UserFromJson(json);
}

