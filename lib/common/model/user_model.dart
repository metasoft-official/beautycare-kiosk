import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    int? id,
    String? name,
    int? username,
    String? password,
    String? email,
    String? zipCode,
    String? address1,
    String? address2,
    String? phoneNumber,
    DateTime? joinDate,
    DateTime? agreeReceiveSmsDate,
    DateTime? agreeReceiveEmailDate,
    String? maritalStatus,
    int? age,
    int? cumulativeNumberOrders,
    int? unavailableReserves,
    int? availableReserves,
    DateTime? birthDate,
    String? gender,
    int? actualPaymentAmount,
    String? nameAuthenticationStatus,
    String? solarCalendarStatus,
    String? area,
    int? totalVisit,
    int? totalReserveUse,
    int? totalActualOrders,
    int? totalOrderAmount,
    int? totalDeposit,
    int? totalReserve,
    DateTime? lastAccessDate,
    DateTime? lastOrderDate,
    int? finalEducationCode,
    int? joinPathCode,
    int? userTypeCode,
    int? userGradeCode,
    String? mobileNumber,
    DateTime? lastModifiedPasswordDate,
    String? status,
    DateTime? createdDate,
    DateTime? lastModifiedDate
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

}