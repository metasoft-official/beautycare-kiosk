import 'package:beauty_care/common/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_dto_model.freezed.dart';
part 'account_dto_model.g.dart';

@freezed
class AccountDtoModel with _$AccountDtoModel {
  factory AccountDtoModel({
    int? roleId,
    int? userId,
    UserModel? userDto,
  }) = _AccountDtoModel;

  factory AccountDtoModel.fromJson(Map<String, dynamic> json) =>
      _$AccountDtoModelFromJson(json);
}
