// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skin_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SkinProductModel _$$_SkinProductModelFromJson(Map<String, dynamic> json) =>
    _$_SkinProductModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      popularityCategoryId: json['popularityCategoryId'] as int?,
      description: json['description'] as String?,
      skintypeCategoryId: json['skintypeCategoryId'] as int?,
      productLineCategoryId: json['productLineCategoryId'] as int?,
      productUrl: json['productUrl'] as String?,
      imageId: json['imageId'] as int?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
      image: json['image'] == null
          ? null
          : IntegratedAttachFileModel.fromJson(
              json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SkinProductModelToJson(_$_SkinProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'popularityCategoryId': instance.popularityCategoryId,
      'description': instance.description,
      'skintypeCategoryId': instance.skintypeCategoryId,
      'productLineCategoryId': instance.productLineCategoryId,
      'productUrl': instance.productUrl,
      'imageId': instance.imageId,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
      'image': instance.image,
    };
