import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_project/common/model/user_model.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

@freezed
class RoleModel with _$RoleModel {
  factory RoleModel({
    int? id,
    String? name,
    int? roleTypeCode,
    int? roleDetailTypeCode,
    String? description,
    String? value,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
}
