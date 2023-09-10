// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _WishlistApi implements WishlistApi {
  _WishlistApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://meta-soft.iptime.org:9000/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<WishlistSkincareProductModel?> getWishlistSkincareProduct(
    userId,
    clinicId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<WishlistSkincareProductModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/common/wishlist-skincare-products/${userId}/${clinicId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null
        ? null
        : WishlistSkincareProductModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<int?> createWishlistSkincareProduct(query) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(query);
    final _result = await _dio.fetch<int>(_setStreamType<int>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/common/wishlist-skincare-products',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<int?> removeWishlistSkincareProductByUserId(query) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(query);
    final _result = await _dio.fetch<int>(_setStreamType<int>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/common/wishlist-skincare-products',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<WishlistClinicModel?> getWishlistClinic(
    userId,
    clinicId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<WishlistClinicModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/common/wishlist-clinics/${userId},${clinicId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null
        ? null
        : WishlistClinicModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PageResponse<WishlistClinicModel>?> getWishlistClinicByUserId(
      query) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(query);
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<PageResponse<WishlistClinicModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/common/wishlist-clinics',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null
        ? null
        : PageResponse<WishlistClinicModel>.fromJson(
            _result.data!,
            (json) =>
                WishlistClinicModel.fromJson(json as Map<String, dynamic>),
          );
    return value;
  }

  @override
  Future<int?> createWishlistClinic(query) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(query);
    final _result = await _dio.fetch<int>(_setStreamType<int>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/common/wishlist-clinics',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<int?> removeWishlistClinicByUserId(query) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(query);
    final _result = await _dio.fetch<int>(_setStreamType<int>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/common/wishlist-clinics',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
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
