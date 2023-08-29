import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_state_model.freezed.dart';

@freezed
class FormStateModel with _$FormStateModel {
  factory FormStateModel({
    String? username,
    String? password,
    String? rePassword,
    String? name,
    String? phFirst,
    String? phSecond,
    String? phThird,
    String? email,
    int? profileImageId,
    bool? isUsernameValid,
    bool? isPasswordValid,
    bool? isRePasswordValid,
    bool? isNameValid,
    bool? isPhFirstValid,
    bool? isPhSecondValid,
    bool? isPhThirdValid,
    bool? isEmailVallid,
    Map<String, bool>? inputStartedFlags,
  }) = _FormStateModel;
}
