import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_model.freezed.dart';
part 'region_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class RegionModel with _$RegionModel {
  factory RegionModel({
    int? id,
    int? parentId,
    String? name,
    int? orderNo,
  }) = _RegionModel;

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);
}
