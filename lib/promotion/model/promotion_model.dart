import 'package:beauty_care/common/model/integrated_attach_file_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion_model.freezed.dart';
part 'promotion_model.g.dart';

@freezed
class PromotionModel with _$PromotionModel {
  factory PromotionModel({
    int? id,
    int? categoryCode,
    String? categoryName,
    String? title,
    int? promotionImageId,
    IntegratedAttachFileModel? promotionImage,
    DateTime? startDate,
    DateTime? endDate,
    String? description,
    String? link,
    String? visibilityStatus,
    int? order,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
  }) = _PromotionModel;

  factory PromotionModel.fromJson(Map<String, dynamic> json) =>
      _$PromotionModelFromJson(json);
}
