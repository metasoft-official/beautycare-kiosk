import 'package:beauty_care/mbti/model/survey_question_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_response_model.freezed.dart';
part 'page_response_model.g.dart';

@Freezed(genericArgumentFactories: true)
class PageResponse<T> with _$PageResponse<T> {
  factory PageResponse({
    bool? hasNext,
    bool? hasPrevious,
    bool? isFirst,
    bool? isLast,
    int? page,
    int? pageEnd,
    int? pageSize,
    int? pageStart,
    int? rowEnd,
    int? rowSize,
    int? rowStart,
    int? totalPages,
    int? totalRows,
    List<T>? items,
  }) = _PageResponse<T>;

  factory PageResponse.fromJson(
          Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$PageResponseFromJson<T>(json, fromJsonT);
}
