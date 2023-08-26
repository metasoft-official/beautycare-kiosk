// ignore_for_file: invalid_annotation_target

import 'package:beauty_care/common/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_dto_model.freezed.dart';
part 'account_dto_model.g.dart';

String? intToString(int? value) {
  if (value == null) {
    return null;
  } else {
    return value.toString();
  }
}

@freezed
class AccountDtoModel with _$AccountDtoModel {
  factory AccountDtoModel({
    @JsonKey(toJson: intToString) int? roleId,
    @JsonKey(toJson: intToString) int? userId,
    UserModel? userDto,
  }) = _AccountDtoModel;

  factory AccountDtoModel.fromJson(Map<String, dynamic> json) =>
      _$AccountDtoModelFromJson(json);
}
