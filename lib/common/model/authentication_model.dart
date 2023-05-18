import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_project/common/model/user_model.dart';

part 'authentication_model.freezed.dart';
part 'authentication_model.g.dart';

@freezed
class AuthenticationModel with _$AuthenticationModel {
  factory AuthenticationModel({
    UserModel? user,
    String? name,
    int? username,
  }) = _AuthenticationModel;

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);
}
