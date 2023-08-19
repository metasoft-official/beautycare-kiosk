import 'dart:ffi';

import 'package:beauty_care/common/model/integrated_attach_file_model.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clinic_skin_mbti_model.freezed.dart';
part 'clinic_skin_mbti_model.g.dart';

@freezed
class ClinicSkinMbtiModel with _$ClinicSkinMbtiModel {
  factory ClinicSkinMbtiModel({
    int? clinicId,
    int? skinMbtiId,
    String? skinMbtiName,
  }) = _ClinicSkinMbtiModel;

  factory ClinicSkinMbtiModel.fromJson(Map<String, dynamic> json) =>
      _$ClinicSkinMbtiModelFromJson(json);
}
