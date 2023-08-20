// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PromotionModel _$$_PromotionModelFromJson(Map<String, dynamic> json) =>
    _$_PromotionModel(
      id: json['id'] as int?,
      categoryCode: json['categoryCode'] as int?,
      categoryName: json['categoryName'] as String?,
      title: json['title'] as String?,
      promotionImageId: json['promotionImageId'] as int?,
      promotionImage: json['promotionImage'] == null
          ? null
          : IntegratedAttachFileModel.fromJson(
              json['promotionImage'] as Map<String, dynamic>),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      description: json['description'] as String?,
      link: json['link'] as String?,
      visibilityStatus: json['visibilityStatus'] as String?,
      order: json['order'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$$_PromotionModelToJson(_$_PromotionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryCode': instance.categoryCode,
      'categoryName': instance.categoryName,
      'title': instance.title,
      'promotionImageId': instance.promotionImageId,
      'promotionImage': instance.promotionImage,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'description': instance.description,
      'link': instance.link,
      'visibilityStatus': instance.visibilityStatus,
      'order': instance.order,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
    };
