// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_param_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyParamModel _$$_SurveyParamModelFromJson(Map<String, dynamic> json) =>
    _$_SurveyParamModel(
      userId: json['userId'] as int?,
      responses: (json['responses'] as List<dynamic>?)
          ?.map((e) => SurveyResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SurveyParamModelToJson(_$_SurveyParamModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'responses': instance.responses,
    };

_$_SurveyResponseModel _$$_SurveyResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_SurveyResponseModel(
      questionId: json['questionId'] as int?,
      answerId: json['answerId'] as int?,
    );

Map<String, dynamic> _$$_SurveyResponseModelToJson(
        _$_SurveyResponseModel instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'answerId': instance.answerId,
    };
