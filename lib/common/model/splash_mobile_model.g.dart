// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_mobile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SplashMobileModel _$$_SplashMobileModelFromJson(Map<String, dynamic> json) =>
    _$_SplashMobileModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      imageId: json['imageId'] as int?,
      image: json['image'] == null
          ? null
          : IntegratedAttachFileModel.fromJson(
              json['image'] as Map<String, dynamic>),
      visibilityStatus: json['visibilityStatus'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$$_SplashMobileModelToJson(
        _$_SplashMobileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageId': instance.imageId,
      'image': instance.image,
      'visibilityStatus': instance.visibilityStatus,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
    };
