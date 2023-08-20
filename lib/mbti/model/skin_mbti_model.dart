import 'package:beauty_care/mbti/model/skin_mbti_caretip_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:beauty_care/mbti/model/skin_mbti_skincare_product_model.dart';
import 'package:beauty_care/mbti/model/skin_mbti_keyword_model.dart';

part 'skin_mbti_model.freezed.dart';
part 'skin_mbti_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class SkinMbtiModel with _$SkinMbtiModel {
  factory SkinMbtiModel({
    int? id,
    String? skinMbtiName,
    String? descriptionEng,
    String? subtitle,
    String? description,
    int? skinTypeCode,
    String? visibilityStatus,
    DateTime? createdTime,
    DateTime? lastModifiedDate,
    String? skinType,
    List<SkinMbtiSkincareProductModel>? skincareProductList,
    List<SkinMbtiKeywordModel>? keywordList,
    List<SkinMbtiCaretipModel>? caretipList,
  }) = _SkinMbtiModel;

  factory SkinMbtiModel.fromJson(Map<String, dynamic> json) =>
      _$SkinMbtiModelFromJson(json);
}
