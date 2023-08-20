import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_skin_mbti_model.freezed.dart';
part 'user_skin_mbti_model.g.dart';

@freezed
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
