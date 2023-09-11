import 'package:beauty_care/common/model/integrated_attach_file_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'skin_product_model.freezed.dart';
part 'skin_product_model.g.dart';

@freezed
class SkinProductModel with _$SkinProductModel {
  factory SkinProductModel({
    int? id,
    String? name,
    int? price,
    int? popularityCategoryId,
    String? description,
    int? skintypeCategoryId,
    int? productLineCategoryId,
    String? productUrl,
    int? imageId,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
    IntegratedAttachFileModel? image,
    String? nameLike,
  }) = _SkinProductModel;

  factory SkinProductModel.fromJson(Map<String, dynamic> json) =>
      _$SkinProductModelFromJson(json);
}
