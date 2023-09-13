// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiseaseModel _$$_DiseaseModelFromJson(Map<String, dynamic> json) =>
    _$_DiseaseModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      nameEng: json['nameEng'] as String?,
      diseaseImageId: json['diseaseImageId'] as int?,
      diseaseImage: json['diseaseImage'] == null
          ? null
          : IntegratedAttachFileModel.fromJson(
              json['diseaseImage'] as Map<String, dynamic>),
      symptoms: json['symptoms'] as String?,
      cause: json['cause'] as String?,
      test: json['test'] as String?,
      treatment: json['treatment'] as String?,
      prevention: json['prevention'] as String?,
      clinicImageId: json['clinicImageId'] as int?,
      clinicImage: json['clinicImage'] == null
          ? null
          : IntegratedAttachFileModel.fromJson(
              json['clinicImage'] as Map<String, dynamic>),
      visibilityStatus: json['visibilityStatus'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
      nameLike: json['nameLike'] as String?,
    );

Map<String, dynamic> _$$_DiseaseModelToJson(_$_DiseaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameEng': instance.nameEng,
      'diseaseImageId': instance.diseaseImageId,
      'diseaseImage': instance.diseaseImage,
      'symptoms': instance.symptoms,
      'cause': instance.cause,
      'test': instance.test,
      'treatment': instance.treatment,
      'prevention': instance.prevention,
      'clinicImageId': instance.clinicImageId,
      'clinicImage': instance.clinicImage,
      'visibilityStatus': instance.visibilityStatus,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
      'nameLike': instance.nameLike,
    };
