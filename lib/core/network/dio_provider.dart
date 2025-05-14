import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final apiKey = dotenv.env['TMDB_API_KEY'] ?? '';

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
        handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.statusCode == 401) {}
        handler.next(response);
      },
      onError: (DioException e, handler) {
        handler.next(e);
      },
    ),
  );

  return dio;
});
