// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_kiosk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BannerKioskModel _$$_BannerKioskModelFromJson(Map<String, dynamic> json) =>
    _$_BannerKioskModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      imageId: json['imageId'] as int?,
      image: json['image'] == null
          ? null
          : IntegratedAttachFileModel.fromJson(
              json['image'] as Map<String, dynamic>),
      visibilityStatus: json['visibilityStatus'] as String?,
      order: json['order'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$$_BannerKioskModelToJson(_$_BannerKioskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageId': instance.imageId,
      'image': instance.image,
      'visibilityStatus': instance.visibilityStatus,
      'order': instance.order,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
    };
