import 'package:freezed_annotation/freezed_annotation.dart';

part 'code_model.freezed.dart';
part 'code_model.g.dart';

@freezed
class CodeModel with _$CodeModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory CodeModel({
    int? id,
    int? parentId,
    String? name,
    String? description,
    String? value,
    int? orderNo,
    String? status,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
  }) = _CodeModel;

  factory CodeModel.fromJson(Map<String, dynamic> json) =>
      _$CodeModelFromJson(json);
}
