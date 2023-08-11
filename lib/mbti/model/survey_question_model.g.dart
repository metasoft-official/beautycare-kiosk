// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyQuestionModel _$SurveyQuestionModelFromJson(Map<String, dynamic> json) =>
    SurveyQuestionModel(
      id: json['id'] as int?,
      categoryCode: json['category_code'] as int?,
      question: json['question'] as String?,
      order: json['order'] as int?,
      kioskVisibilityStatus: json['kiosk_visibility_status'] as String?,
      appVisibilityStatus: json['app_visibility_status'] as String?,
      visibilityStatus: json['visibility_status'] as String?,
      createdTime: json['created_time'] == null
          ? null
          : DateTime.parse(json['created_time'] as String),
      lastModifiedDate: json['last_modified_date'] == null
          ? null
          : DateTime.parse(json['last_modified_date'] as String),
      surveyAnswerList: (json['survey_answer_list'] as List<dynamic>?)
          ?.map((e) => SurveyAnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurveyQuestionModelToJson(
        SurveyQuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_code': instance.categoryCode,
      'question': instance.question,
      'order': instance.order,
      'kiosk_visibility_status': instance.kioskVisibilityStatus,
      'app_visibility_status': instance.appVisibilityStatus,
      'visibility_status': instance.visibilityStatus,
      'created_time': instance.createdTime?.toIso8601String(),
      'last_modified_date': instance.lastModifiedDate?.toIso8601String(),
      'survey_answer_list': instance.surveyAnswerList,
    };

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
      'surveyAnswerList':
          instance.surveyAnswerList?.map((e) => e.toJson()).toList(),
    };
