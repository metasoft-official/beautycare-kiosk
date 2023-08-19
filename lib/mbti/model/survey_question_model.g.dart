// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyQuestionModel _$$_SurveyQuestionModelFromJson(
        Map<String, dynamic> json) =>
    _$_SurveyQuestionModel(
      id: json['id'] as int?,
      categoryCode: json['categoryCode'] as int?,
      question: json['question'] as String?,
      order: json['order'] as int?,
      kioskVisibilityStatus: json['kioskVisibilityStatus'] as String?,
      appVisibilityStatus: json['appVisibilityStatus'] as String?,
      visibilityStatus: json['visibilityStatus'] as String?,
      createdTime: json['createdTime'] == null
          ? null
          : DateTime.parse(json['createdTime'] as String),
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
      surveyAnswerList: (json['surveyAnswerList'] as List<dynamic>?)
          ?.map((e) => SurveyAnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SurveyQuestionModelToJson(
        _$_SurveyQuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryCode': instance.categoryCode,
      'question': instance.question,
      'order': instance.order,
      'kioskVisibilityStatus': instance.kioskVisibilityStatus,
      'appVisibilityStatus': instance.appVisibilityStatus,
      'visibilityStatus': instance.visibilityStatus,
      'createdTime': instance.createdTime?.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
      'surveyAnswerList': instance.surveyAnswerList,
    };
