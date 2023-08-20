import 'package:beauty_care/common/model/integrated_attach_file_model.dart';
import 'package:beauty_care/oxyfacial/model/oxy_facial_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'skin_mbti_caretip_model.freezed.dart';
part 'skin_mbti_caretip_model.g.dart';

@freezed
class SkinMbtiCaretipModel with _$SkinMbtiCaretipModel {
  factory SkinMbtiCaretipModel({
    int? id,
    int? skinMbtiId,
    String? content,
    int? sortOrder,
    DateTime? createdTime,
    DateTime? lastModifiedDate,
  }) = _SkinMbtiCaretipModel;

  factory SkinMbtiCaretipModel.fromJson(Map<String, dynamic> json) =>
      _$SkinMbtiCaretipModelFromJson(json);
}
