import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_disease_model.freezed.dart';
part 'user_disease_model.g.dart';

@freezed
class UserDieseaseModel with _$UserDieseaseModel {
  factory UserDieseaseModel({
    int? id,
    int? userId,
    String? topk1Label,
    double? topk1Value,
    int? topk1Id,
    String? topk2Label,
    double? topk2Value,
    int? topk2Id,
    String? topk3Label,
    double? topk3Value,
    int? topk3Id,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
  }) = _UserDieseaseModel;

  factory UserDieseaseModel.fromJson(Map<String, dynamic> json) =>
      _$UserDieseaseModelFromJson(json);
}
