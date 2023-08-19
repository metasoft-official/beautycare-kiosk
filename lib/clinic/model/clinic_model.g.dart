// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClinicModel _$$_ClinicModelFromJson(Map<String, dynamic> json) =>
    _$_ClinicModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      logoImageId: json['logoImageId'] as int?,
      logoImage: json['logoImage'] == null
          ? null
          : IntegratedAttachFileModel.fromJson(
              json['logoImage'] as Map<String, dynamic>),
      mainImageId: json['mainImageId'] as int?,
      mainImage: json['mainImage'] == null
          ? null
          : IntegratedAttachFileModel.fromJson(
              json['mainImage'] as Map<String, dynamic>),
      addressDepth1Id: json['addressDepth1Id'] as int?,
      addressDepth1Name: json['addressDepth1Name'] as String?,
      addressDepth2Id: json['addressDepth2Id'] as int?,
      homepageLink: json['homepageLink'] as String?,
      kakaotalkChannelLink: json['kakaotalkChannelLink'] as String?,
      description: json['description'] as String?,
      visibilityStatus: json['visibilityStatus'] as String?,
      specialtyStoreStatus: json['specialtyStoreStatus'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
      diseaseList: (json['diseaseList'] as List<dynamic>?)
          ?.map((e) => ClinicDiseaseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      skinMbtiList: (json['skinMbtiList'] as List<dynamic>?)
          ?.map((e) => ClinicSkinMbtiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ClinicModelToJson(_$_ClinicModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoImageId': instance.logoImageId,
      'logoImage': instance.logoImage,
      'mainImageId': instance.mainImageId,
      'mainImage': instance.mainImage,
      'addressDepth1Id': instance.addressDepth1Id,
      'addressDepth1Name': instance.addressDepth1Name,
      'addressDepth2Id': instance.addressDepth2Id,
      'homepageLink': instance.homepageLink,
      'kakaotalkChannelLink': instance.kakaotalkChannelLink,
      'description': instance.description,
      'visibilityStatus': instance.visibilityStatus,
      'specialtyStoreStatus': instance.specialtyStoreStatus,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
      'diseaseList': instance.diseaseList,
      'skinMbtiList': instance.skinMbtiList,
    };
