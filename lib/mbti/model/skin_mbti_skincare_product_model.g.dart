// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skin_mbti_skincare_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SkinMbtiSkincareProductModel _$$_SkinMbtiSkincareProductModelFromJson(
        Map<String, dynamic> json) =>
    _$_SkinMbtiSkincareProductModel(
      id: json['id'] as int?,
      skinMbtiId: json['skinMbtiId'] as String?,
      skincareCategoryId: json['skincareCategoryId'] as int?,
      skincareProductId: json['skincareProductId'] as int?,
      skincareProductOrder: json['skincareProductOrder'] as int?,
      skincareProduct: json['skincareProduct'] == null
          ? null
          : SkinProductModel.fromJson(
              json['skincareProduct'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SkinMbtiSkincareProductModelToJson(
        _$_SkinMbtiSkincareProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'skinMbtiId': instance.skinMbtiId,
      'skincareCategoryId': instance.skincareCategoryId,
      'skincareProductId': instance.skincareProductId,
      'skincareProductOrder': instance.skincareProductOrder,
      'skincareProduct': instance.skincareProduct,
    };
