// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integrated_attach_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntegratedAttachFileModel _$IntegratedAttachFileModelFromJson(
        Map<String, dynamic> json) =>
    IntegratedAttachFileModel(
      integratedAttachFileNum: json['integrated_attach_file_num'] as int?,
      attachFileTypeCode: json['attach_file_type_code'] as int?,
      originFileName: json['origin_file_name'] as String?,
      saveFileName: json['save_file_name'] as String?,
      filePath: json['file_path'] as String?,
      fileSize: json['file_size'] as int?,
      fileExtension: json['file_extension'] as String?,
      fileType: json['file_type'] as String?,
      createdUserNum: json['created_user_num'] as int?,
      modifiedUserNum: json['modified_user_num'] as int?,
      createDate: json['create_date'] == null
          ? null
          : DateTime.parse(json['create_date'] as String),
      modifyDate: json['modify_date'] == null
          ? null
          : DateTime.parse(json['modify_date'] as String),
    );

Map<String, dynamic> _$IntegratedAttachFileModelToJson(
        IntegratedAttachFileModel instance) =>
    <String, dynamic>{
      'integrated_attach_file_num': instance.integratedAttachFileNum,
      'attach_file_type_code': instance.attachFileTypeCode,
      'origin_file_name': instance.originFileName,
      'save_file_name': instance.saveFileName,
      'file_path': instance.filePath,
      'file_size': instance.fileSize,
      'file_extension': instance.fileExtension,
      'file_type': instance.fileType,
      'created_user_num': instance.createdUserNum,
      'modified_user_num': instance.modifiedUserNum,
      'create_date': instance.createDate?.toIso8601String(),
      'modify_date': instance.modifyDate?.toIso8601String(),
    };

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
