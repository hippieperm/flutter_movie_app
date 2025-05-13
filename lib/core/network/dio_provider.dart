import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final apiKey = dotenv.env['TMDB_API_KEY'] ?? '';
  print('DioProvider: API 키 확인: ${apiKey.isNotEmpty ? '설정됨' : '없음'}');

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {'api_key': apiKey},
      contentType: 'application/json',
      validateStatus: (status) {
        return status != null && status < 500;
      },
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Request: ${options.method} ${options.uri}');
        handler.next(options);
      },
      onResponse: (response, handler) {
        print(
          'Response: ${response.statusCode} ${response.requestOptions.uri}',
        );
        if (response.statusCode == 401) {
          print('401 오류 응답 데이터: ${response.data}');
        }
        handler.next(response);
      },
      onError: (DioException e, handler) {
        print('Error: ${e.message}, URI: ${e.requestOptions.uri}');
        handler.next(e);
      },
    ),
  );

  return dio;
});
