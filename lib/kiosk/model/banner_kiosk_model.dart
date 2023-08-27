import 'package:beauty_care/common/model/integrated_attach_file_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_kiosk_model.freezed.dart';
part 'banner_kiosk_model.g.dart';

@freezed
class BannerKioskModel with _$BannerKioskModel {
  factory BannerKioskModel({
    int? id,
    String? title,
    int? imageId,
    IntegratedAttachFileModel? image,
    String? visibilityStatus,
    int? order,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
  }) = _BannerKioskModel;

  factory BannerKioskModel.fromJson(Map<String, dynamic> json) =>
      _$BannerKioskModelFromJson(json);
}
