// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_skincare_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WishlistSkincareProductModel _$$_WishlistSkincareProductModelFromJson(
        Map<String, dynamic> json) =>
    _$_WishlistSkincareProductModel(
      userId: json['userId'] as int?,
      parentId: json['parentId'] as int?,
      skincareProduct: json['skincareProduct'] == null
          ? null
          : SkinProductModel.fromJson(
              json['skincareProduct'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WishlistSkincareProductModelToJson(
        _$_WishlistSkincareProductModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'parentId': instance.parentId,
      'skincareProduct': instance.skincareProduct,
    };
