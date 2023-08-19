import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_param_model.freezed.dart';
part 'survey_param_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class SurveyParamModel with _$SurveyParamModel {
  factory SurveyParamModel({
    int? userId,
    List<SurveyResponseModel>? responses,
  }) = _SurveyParamModel;

  factory SurveyParamModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyParamModelFromJson(json);
}

@freezed
class SurveyResponseModel with _$SurveyResponseModel {
  factory SurveyResponseModel({int? questionId, int? answerId}) =
      _SurveyResponseModel;

  factory SurveyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyResponseModelFromJson(json);
}
