import 'package:freezed_annotation/freezed_annotation.dart';

part 'code_model.freezed.dart';
part 'code_model.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
@JsonSerializable(explicitToJson: true)
class CodeModel with _$CodeModel {
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
