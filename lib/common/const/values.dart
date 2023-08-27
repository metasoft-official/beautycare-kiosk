import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// const String BASE_URL = 'http://10.0.2.2:9000/api';
// const String BASE_URL = 'http://meta-soft.iptime.org:9000/api';
// const String BASE_URL = 'http://192.168.0.52:9000/api';
const String BASE_URL = 'http://192.168.35.113:9000/api';

class Strings {
  Strings._();

  static const String imageUrl = "$BASE_URL/image/";

  // static const String imageUrl = "$frontUrl/api/image/";
  // static const String videoUrl = "$frontUrl/api/video/";
  // static const String audioUrl = "$frontUrl/api/audio/";
  // static const String fileUrl = "$frontUrl/api/integrated-file/";
}

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = BASE_URL;
  return dio;
});
