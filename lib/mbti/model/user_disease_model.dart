import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_disease_model.freezed.dart';
part 'user_disease_model.g.dart';

@freezed
class UserDiseaseModel with _$UserDiseaseModel {
  factory UserDiseaseModel({
    int? id,
    int? userId,
    int? imageId,
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
  }) = _UserDiseaseModel;

  factory UserDiseaseModel.fromJson(Map<String, dynamic> json) =>
      _$UserDiseaseModelFromJson(json);
}
