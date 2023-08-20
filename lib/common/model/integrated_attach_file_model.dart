import 'package:freezed_annotation/freezed_annotation.dart';

part 'integrated_attach_file_model.freezed.dart';
part 'integrated_attach_file_model.g.dart';

@freezed
class IntegratedAttachFileModel with _$IntegratedAttachFileModel {
  factory IntegratedAttachFileModel({
    int? integratedAttachFileNum,
    int? attachFileTypeCode,
    String? originFileName,
    String? saveFileName,
    String? filePath,
    int? fileSize,
    String? fileExtension,
    String? fileType,
    int? createdUserNum,
    int? modifiedUserNum,
    DateTime? createDate,
    DateTime? modifyDate,
  }) = _IntegratedAttachFileModel;

  factory IntegratedAttachFileModel.fromJson(Map<String, dynamic> json) =>
      _$IntegratedAttachFileModelFromJson(json);
}
