import 'dart:ffi';

import 'package:beauty_care/common/model/integrated_attach_file_model.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clinic_disease_model.freezed.dart';
part 'clinic_disease_model.g.dart';

@freezed
class ClinicDiseaseModel with _$ClinicDiseaseModel {
  factory ClinicDiseaseModel({
    int? clinicId,
    int? diseaseId,
    String? diseaseName,
  }) = _ClinicDiseaseModel;

  factory ClinicDiseaseModel.fromJson(Map<String, dynamic> json) =>
      _$ClinicDiseaseModelFromJson(json);
}
