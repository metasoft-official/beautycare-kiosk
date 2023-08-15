// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyAnswerModel _$$_SurveyAnswerModelFromJson(Map<String, dynamic> json) =>
    _$_SurveyAnswerModel(
      id: json['id'] as int?,
      questionId: json['questionId'] as int?,
      answer: json['answer'] as String?,
      order: json['order'] as int?,
      score: json['score'] as int?,
    );

Map<String, dynamic> _$$_SurveyAnswerModelToJson(
        _$_SurveyAnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionId': instance.questionId,
      'answer': instance.answer,
      'order': instance.order,
      'score': instance.score,
    };
