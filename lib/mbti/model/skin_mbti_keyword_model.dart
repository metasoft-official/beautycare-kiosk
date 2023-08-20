import 'package:freezed_annotation/freezed_annotation.dart';

part 'skin_mbti_keyword_model.freezed.dart';
part 'skin_mbti_keyword_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class SkinMbtiKeywordModel with _$SkinMbtiKeywordModel {
  factory SkinMbtiKeywordModel({
    int? id,
    int? skinMbtiId,
    int? keywordCode,
    String? keyword,
  }) = _SkinMbtiKeywordModel;

  factory SkinMbtiKeywordModel.fromJson(Map<String, dynamic> json) =>
      _$SkinMbtiKeywordModelFromJson(json);
}
