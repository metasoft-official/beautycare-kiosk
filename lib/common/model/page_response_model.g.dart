// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PageResponse<T> _$$_PageResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_PageResponse<T>(
      hasNext: json['hasNext'] as bool?,
      hasPrevious: json['hasPrevious'] as bool?,
      isFirst: json['isFirst'] as bool?,
      isLast: json['isLast'] as bool?,
      page: json['page'] as int?,
      pageEnd: json['pageEnd'] as int?,
      pageSize: json['pageSize'] as int?,
      pageStart: json['pageStart'] as int?,
      rowEnd: json['rowEnd'] as int?,
      rowSize: json['rowSize'] as int?,
      rowStart: json['rowStart'] as int?,
      totalPages: json['totalPages'] as int?,
      totalRows: json['totalRows'] as int?,
      items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$_PageResponseToJson<T>(
  _$_PageResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'hasNext': instance.hasNext,
      'hasPrevious': instance.hasPrevious,
      'isFirst': instance.isFirst,
      'isLast': instance.isLast,
      'page': instance.page,
      'pageEnd': instance.pageEnd,
      'pageSize': instance.pageSize,
      'pageStart': instance.pageStart,
      'rowEnd': instance.rowEnd,
      'rowSize': instance.rowSize,
      'rowStart': instance.rowStart,
      'totalPages': instance.totalPages,
      'totalRows': instance.totalRows,
      'items': instance.items?.map(toJsonT).toList(),
    };
