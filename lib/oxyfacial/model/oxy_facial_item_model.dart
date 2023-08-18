import 'package:freezed_annotation/freezed_annotation.dart';

import 'oxy_facial_model.dart';

part 'oxy_facial_item_model.freezed.dart';
part 'oxy_facial_item_model.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class OxyFacialItemModel with _$OxyFacialItemModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory OxyFacialItemModel({int? id, int? oxyFacialId, String? item}) =
      _OxyFacialItemModel;

  factory OxyFacialItemModel.fromJson(Map<String, dynamic> json) =>
      _$OxyFacialItemModelFromJson(json);
}
