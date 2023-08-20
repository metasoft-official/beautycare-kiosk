// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_disease_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$UserDiseaseModelToJson(UserDiseaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'imageId': instance.imageId,
      'image': instance.image?.toJson(),
      'topk1Label': instance.topk1Label,
      'topk1Id': instance.topk1Id,
      'topk1Value': instance.topk1Value,
      'topk2Label': instance.topk2Label,
      'topk2Id': instance.topk2Id,
      'topk2Value': instance.topk2Value,
      'topk3Label': instance.topk3Label,
      'topk3Id': instance.topk3Id,
      'topk3Value': instance.topk3Value,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
      'topk1Disease': instance.topk1Disease?.toJson(),
      'topk1DiseaseImage': instance.topk1DiseaseImage?.toJson(),
      'topk2Disease': instance.topk2Disease?.toJson(),
      'topk2DiseaseImage': instance.topk2DiseaseImage?.toJson(),
      'topk3Disease': instance.topk3Disease?.toJson(),
      'topk3DiseaseImage': instance.topk3DiseaseImage?.toJson(),
    };

_$_UserDiseaseModel _$$_UserDiseaseModelFromJson(Map<String, dynamic> json) =>
    _$_UserDiseaseModel(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      imageId: json['imageId'] as int?,
      image: json['image'] == null
          ? null
          : IntegratedAttachFileModel.fromJson(
              json['image'] as Map<String, dynamic>),
      topk1Label: json['topk1Label'] as String?,
      topk1Id: json['topk1Id'] as int?,
      topk1Value: (json['topk1Value'] as num?)?.toDouble(),
      topk2Label: json['topk2Label'] as String?,
      topk2Id: json['topk2Id'] as int?,
      topk2Value: (json['topk2Value'] as num?)?.toDouble(),
      topk3Label: json['topk3Label'] as String?,
      topk3Id: json['topk3Id'] as int?,
      topk3Value: (json['topk3Value'] as num?)?.toDouble(),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
      topk1Disease: json['topk1Disease'] == null
          ? null
          : DiseaseModel.fromJson(json['topk1Disease'] as Map<String, dynamic>),
      topk1DiseaseImage: json['topk1DiseaseImage'] == null
          ? null
          : IntegratedAttachFileModel.fromJson(
              json['topk1DiseaseImage'] as Map<String, dynamic>),
      topk2Disease: json['topk2Disease'] == null
          ? null
          : DiseaseModel.fromJson(json['topk2Disease'] as Map<String, dynamic>),
      topk2DiseaseImage: json['topk2DiseaseImage'] == null
          ? null
          : IntegratedAttachFileModel.fromJson(
              json['topk2DiseaseImage'] as Map<String, dynamic>),
      topk3Disease: json['topk3Disease'] == null
          ? null
          : DiseaseModel.fromJson(json['topk3Disease'] as Map<String, dynamic>),
      topk3DiseaseImage: json['topk3DiseaseImage'] == null
          ? null
          : IntegratedAttachFileModel.fromJson(
              json['topk3DiseaseImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserDiseaseModelToJson(_$_UserDiseaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'imageId': instance.imageId,
      'image': instance.image,
      'topk1Label': instance.topk1Label,
      'topk1Id': instance.topk1Id,
      'topk1Value': instance.topk1Value,
      'topk2Label': instance.topk2Label,
      'topk2Id': instance.topk2Id,
      'topk2Value': instance.topk2Value,
      'topk3Label': instance.topk3Label,
      'topk3Id': instance.topk3Id,
      'topk3Value': instance.topk3Value,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
      'topk1Disease': instance.topk1Disease,
      'topk1DiseaseImage': instance.topk1DiseaseImage,
      'topk2Disease': instance.topk2Disease,
      'topk2DiseaseImage': instance.topk2DiseaseImage,
      'topk3Disease': instance.topk3Disease,
      'topk3DiseaseImage': instance.topk3DiseaseImage,
    };
