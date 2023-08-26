// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_mobile_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _SplashMobileApi implements SplashMobileApi {
  _SplashMobileApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://meta-soft.iptime.org:9000/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PageResponse<SplashMobileModel>> getSplashMobileAll() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PageResponse<SplashMobileModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/common/splash-mobiles',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PageResponse<SplashMobileModel>.fromJson(
      _result.data!,
      (json) => SplashMobileModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<PageResponse<SplashMobileModel>> getSplashMobileByQuery(query) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PageResponse<SplashMobileModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/common/splash-mobiles',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PageResponse<SplashMobileModel>.fromJson(
      _result.data!,
      (json) => SplashMobileModel.fromJson(json as Map<String, dynamic>),
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