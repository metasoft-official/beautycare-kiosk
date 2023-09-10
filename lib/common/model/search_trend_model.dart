import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_trend_model.freezed.dart';
part 'search_trend_model.g.dart';

@freezed
class SearchTrendModel with _$SearchTrendModel {
  factory SearchTrendModel({
    int? id,
    String? searchKeyword,
    String? visibilityStatus,
    int? title,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
  }) = _SearchTrendModel;

  factory SearchTrendModel.fromJson(Map<String, dynamic> json) =>
      _$SearchTrendModelFromJson(json);
}
