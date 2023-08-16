import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel(
      {int? id,
      String? name,
      String? username,
      String? password,
      String? email,
      String? zipCode,
      String? address1,
      String? address2,
      String? phoneNumber,
      DateTime? joinDate,
      int? age,
      DateTime? birthDate,
      String? gender,
      DateTime? lastAccessDate,
      String? mobileNumber,
      DateTime? lastModifiedPasswordDate,
      String? status,
      DateTime? createdDate,
      DateTime? lastModifiedDate,
      String? socialLoginId,
      String? socialLoginType}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
