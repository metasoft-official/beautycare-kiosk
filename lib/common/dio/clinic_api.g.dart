// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ClinicApi implements ClinicApi {
  _ClinicApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://192.168.35.113:9000/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PageResponse<ClinicModel>> getClinicAll() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PageResponse<ClinicModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/common/clinics',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PageResponse<ClinicModel>.fromJson(
      _result.data!,
      (json) => ClinicModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<PageResponse<ClinicModel>> getClinicByQuery(query) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PageResponse<ClinicModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/common/clinics',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PageResponse<ClinicModel>.fromJson(
      _result.data!,
      (json) => ClinicModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}