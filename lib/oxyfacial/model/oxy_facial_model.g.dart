// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oxy_facial_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OxyFacialModel _$$_OxyFacialModelFromJson(Map<String, dynamic> json) =>
    _$_OxyFacialModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      nameEng: json['nameEng'] as String?,
      backgroundImageId: json['backgroundImageId'] as int?,
      backgroundImage: json['backgroundImage'] == null
          ? null
          : IntegratedAttachFileModel.fromJson(
              json['backgroundImage'] as Map<String, dynamic>),
      deviceImageId: json['deviceImageId'] as int?,
      deviceImage: json['deviceImage'] == null
          ? null
          : IntegratedAttachFileModel.fromJson(
              json['deviceImage'] as Map<String, dynamic>),
      description: json['description'] as String?,
      visibilityStatus: json['visibilityStatus'] as String?,
      createdTime: json['createdTime'] == null
          ? null
          : DateTime.parse(json['createdTime'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
      itemList: (json['itemList'] as List<dynamic>?)
          ?.map((e) => OxyFacialItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OxyFacialModelToJson(_$_OxyFacialModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameEng': instance.nameEng,
      'backgroundImageId': instance.backgroundImageId,
      'backgroundImage': instance.backgroundImage?.toJson(),
      'deviceImageId': instance.deviceImageId,
      'deviceImage': instance.deviceImage?.toJson(),
      'description': instance.description,
      'visibilityStatus': instance.visibilityStatus,
      'createdTime': instance.createdTime?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
      'itemList': instance.itemList?.map((e) => e.toJson()).toList(),
    };
