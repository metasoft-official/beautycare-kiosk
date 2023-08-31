import 'package:beauty_care/cosmetic/model/skin_product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_skincare_product_model.freezed.dart';
part 'wishlist_skincare_product_model.g.dart';

@freezed
class WishlistSkincareProductModel with _$WishlistSkincareProductModel {
  factory WishlistSkincareProductModel({
    int? userId,
    int? parentId,
    SkinProductModel? skincareProduct,
  }) = _WishlistSkincareProductModel;

  factory WishlistSkincareProductModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistSkincareProductModelFromJson(json);
}
