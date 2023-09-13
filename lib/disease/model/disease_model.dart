import 'dart:ffi';

import 'package:beauty_care/common/model/integrated_attach_file_model.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'disease_model.freezed.dart';
part 'disease_model.g.dart';

@freezed
class DiseaseModel with _$DiseaseModel {
  factory DiseaseModel({
    int? id,
    String? name,
    String? nameEng,
    int? diseaseImageId,
    IntegratedAttachFileModel? diseaseImage,
    String? symptoms,
    String? cause,
    String? test,
    String? treatment,
    String? prevention,
    int? clinicImageId,
    IntegratedAttachFileModel? clinicImage,
    String? visibilityStatus,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
    String? nameLike,
  }) = _DiseaseModel;

  factory DiseaseModel.fromJson(Map<String, dynamic> json) =>
      _$DiseaseModelFromJson(json);
}
