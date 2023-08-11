// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DiagnosisApi implements DiagnosisApi {
  _DiagnosisApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://220.76.251.246:18812';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DiagnosisResultModel> uploadDiagnosisImage(file) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'file',
        MultipartFile.fromBytes(
          file,
          filename: null,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DiagnosisResultModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DiagnosisResultModel.fromJson(_result.data!);
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
