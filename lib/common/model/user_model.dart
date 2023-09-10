// ignore_for_file: invalid_annotation_target

import 'package:beauty_care/common/model/integrated_attach_file_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

String? datetimeToLocalDateTime(DateTime? value) {
  if (value == null) {
    return null;
  } else {
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(value);
  }
}

String? intToString(int? value) {
  if (value == null) {
    return null;
  } else {
    return value.toString();
  }
}

@freezed
class UserModel with _$UserModel {
  factory UserModel(
      {@JsonKey(toJson: intToString)
          int? id,
      String? name,
      String? username,
      String? password,
      String? email,
      String? zipCode,
      String? address1,
      String? address2,
      String? phoneNumber,
      @JsonKey(toJson: datetimeToLocalDateTime)
          DateTime? joinDate,
      @JsonKey(toJson: intToString)
          int? age,
      @JsonKey(toJson: datetimeToLocalDateTime)
          birthDate,
      String? gender,
      @JsonKey(toJson: datetimeToLocalDateTime)
          DateTime? lastAccessDate,
      String? mobileNumber,
      @JsonKey(toJson: datetimeToLocalDateTime)
          DateTime? lastModifiedPasswordDate,
      String? status,
      @JsonKey(toJson: datetimeToLocalDateTime)
          DateTime? createdDate,
      @JsonKey(toJson: datetimeToLocalDateTime)
          DateTime? lastModifiedDate,
      String? socialLoginId,
      String? socialLoginType,
      @JsonKey(toJson: intToString)
          int? profileImageId,
      IntegratedAttachFileModel? profileImage,
      String? accessToken,
      String? refreshToken}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
