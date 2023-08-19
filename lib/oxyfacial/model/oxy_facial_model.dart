import 'package:beauty_care/common/model/integrated_attach_file_model.dart';
import 'package:beauty_care/oxyfacial/model/oxy_facial_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'oxy_facial_model.freezed.dart';
part 'oxy_facial_model.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class OxyFacialModel with _$OxyFacialModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory OxyFacialModel({
    int? id,
    String? name,
    String? nameEng,
    int? backgroundImageId,
    IntegratedAttachFileModel? backgroundImage,
    int? deviceImageId,
    IntegratedAttachFileModel? deviceImage,
    String? description,
    String? visibilityStatus,
    DateTime? createdTime,
    DateTime? lastModifiedDate,
    List<OxyFacialItemModel>? itemList,
  }) = _OxyFacialModel;

  factory OxyFacialModel.fromJson(Map<String, dynamic> json) =>
      _$OxyFacialModelFromJson(json);
}
