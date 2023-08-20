import 'package:beauty_care/mbti/model/skin_mbti_caretip_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:beauty_care/mbti/model/skin_mbti_skincare_product_model.dart';
import 'package:beauty_care/mbti/model/skin_mbti_keyword_model.dart';

part 'user_skin_mbti_model.freezed.dart';
part 'user_skin_mbti_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class UserSkinMbtiModel with _$UserSkinMbtiModel {
  factory UserSkinMbtiModel(
      {int? id,
      int? userId,
      int? surveyId,
      int? skinMbtiId,
      double? category1Score,
      String? category1Type,
      double? category2Score,
      String? category2Type,
      double? category3Score,
      String? category3Type,
      double? category4Score,
      String? category4Type,
      DateTime? createdTime,
      DateTime? lastModifiedDate,
      String? skinMbtiName,
      String? descriptionEng}) = _UserSkinMbtiModel;

  factory UserSkinMbtiModel.fromJson(Map<String, dynamic> json) =>
      _$UserSkinMbtiModelFromJson(json);
}
