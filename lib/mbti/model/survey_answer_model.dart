import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_answer_model.freezed.dart';
part 'survey_answer_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class SurveyAnswerModel with _$SurveyAnswerModel {
  factory SurveyAnswerModel({
    int? id,
    int? questionId,
    String? answer,
    int? order,
    int? score,
  }) = _SurveyAnswerModel;

  factory SurveyAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyAnswerModelFromJson(json);
}
