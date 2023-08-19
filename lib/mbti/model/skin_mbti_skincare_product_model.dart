import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:beauty_care/cosmetic/model/skin_product_model.dart';

part 'skin_mbti_skincare_product_model.freezed.dart';
part 'skin_mbti_skincare_product_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class SkinMbtiSkincareProductModel with _$SkinMbtiSkincareProductModel {
  factory SkinMbtiSkincareProductModel({
    int? id,
    String? skinMbtiId,
    int? skincareCategoryId,
    int? skincareProductId,
    int? skincareProductOrder,
    SkinProductModel? skincareProduct,
  }) = _SkinMbtiSkincareProductModel;

  factory SkinMbtiSkincareProductModel.fromJson(Map<String, dynamic> json) =>
      _$SkinMbtiSkincareProductModelFromJson(json);
}
