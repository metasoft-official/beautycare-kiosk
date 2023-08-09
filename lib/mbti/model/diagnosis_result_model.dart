import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnosis_result_model.freezed.dart';
part 'diagnosis_result_model.g.dart';

@freezed
class DiagnosisResultModel with _$DiagnosisResultModel {
  factory DiagnosisResultModel(
      {int? id,
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
      DateTime? lastModifiedDate}) = _DiagnosisResultModel;

  factory DiagnosisResultModel.fromJson(Map<String, dynamic> json) =>
      _$DiagnosisResultModelFromJson(json);
}
