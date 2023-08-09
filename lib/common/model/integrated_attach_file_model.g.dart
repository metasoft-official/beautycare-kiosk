// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integrated_attach_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IntegratedAttachFileModel _$$_IntegratedAttachFileModelFromJson(
        Map<String, dynamic> json) =>
    _$_IntegratedAttachFileModel(
      integratedAttachFileNum: json['integratedAttachFileNum'] as int?,
      attachFileTypeCode: json['attachFileTypeCode'] as int?,
      originFileName: json['originFileName'] as String?,
      saveFileName: json['saveFileName'] as String?,
      filePath: json['filePath'] as String?,
      fileSize: json['fileSize'] as int?,
      fileExtension: json['fileExtension'] as String?,
      fileType: json['fileType'] as String?,
      createdUserNum: json['createdUserNum'] as int?,
      modifiedUserNum: json['modifiedUserNum'] as int?,
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      modifyDate: json['modifyDate'] == null
          ? null
          : DateTime.parse(json['modifyDate'] as String),
    );

Map<String, dynamic> _$$_IntegratedAttachFileModelToJson(
        _$_IntegratedAttachFileModel instance) =>
    <String, dynamic>{
      'integratedAttachFileNum': instance.integratedAttachFileNum,
      'attachFileTypeCode': instance.attachFileTypeCode,
      'originFileName': instance.originFileName,
      'saveFileName': instance.saveFileName,
      'filePath': instance.filePath,
      'fileSize': instance.fileSize,
      'fileExtension': instance.fileExtension,
      'fileType': instance.fileType,
      'createdUserNum': instance.createdUserNum,
      'modifiedUserNum': instance.modifiedUserNum,
      'createDate': instance.createDate?.toIso8601String(),
      'modifyDate': instance.modifyDate?.toIso8601String(),
    };
