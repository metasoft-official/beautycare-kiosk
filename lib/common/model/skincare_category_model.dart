import 'package:freezed_annotation/freezed_annotation.dart';

part 'skincare_category_model.freezed.dart';
part 'skincare_category_model.g.dart';

@freezed
class SkincareCategoryModel with _$SkincareCategoryModel {
  factory SkincareCategoryModel({
    int? id,
    int? parentId,
    String? name,
    int? ranking,
    String? description,
    String? value,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
  }) = _SkincareCategoryModel;

  factory SkincareCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SkincareCategoryModelFromJson(json);
}
