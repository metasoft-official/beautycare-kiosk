import 'dart:ffi';

import 'package:beauty_care/clinic/model/clinic_disease_model.dart';
import 'package:beauty_care/clinic/model/clinic_skin_mbti_model.dart';
import 'package:beauty_care/common/model/integrated_attach_file_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clinic_model.freezed.dart';
part 'clinic_model.g.dart';

@freezed
class ClinicModel with _$ClinicModel {
  factory ClinicModel({
    int? id,
    String? name,
    int? logoImageId,
    IntegratedAttachFileModel? logoImage,
    int? mainImageId,
    IntegratedAttachFileModel? mainImage,
    int? addressDepth1Id,
    String? addressDepth1Name,
    int? addressDepth2Id,
    String? homepageLink,
    String? kakaotalkChannelLink,
    String? description,
    String? visibilityStatus,
    String? specialtyStoreStatus,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
    List<ClinicDiseaseModel>? diseaseList,
    List<ClinicSkinMbtiModel>? skinMbtiList,
  }) = _ClinicModel;

  factory ClinicModel.fromJson(Map<String, dynamic> json) =>
      _$ClinicModelFromJson(json);
}
