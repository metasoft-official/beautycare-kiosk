import 'package:freezed_annotation/freezed_annotation.dart';

import 'survey_answer_model.dart';

part 'survey_question_model.freezed.dart';
part 'survey_question_model.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class SurveyQuestionModel with _$SurveyQuestionModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory SurveyQuestionModel({
    int? id,
    int? categoryCode,
    String? question,
    int? order,
    String? kioskVisibilityStatus,
    String? appVisibilityStatus,
    String? visibilityStatus,
    DateTime? createdTime,
    DateTime? lastModifiedDate,
    List<SurveyAnswerModel>? surveyAnswerList,
  }) = _SurveyQuestionModel;

  factory SurveyQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyQuestionModelFromJson(json);
}
