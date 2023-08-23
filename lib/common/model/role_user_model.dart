import 'package:beauty_care/common/model/role_model.dart';
import 'package:beauty_care/common/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_user_model.freezed.dart';
part 'role_user_model.g.dart';

@freezed
class RoleUserModel with _$RoleUserModel {
  factory RoleUserModel({
    int? id,
    int? roleId,
    int? userId,
    RoleModel? role,
    UserModel? user,
  }) = _RoleUserModel;

  factory RoleUserModel.fromJson(Map<String, dynamic> json) =>
      _$RoleUserModelFromJson(json);
}
