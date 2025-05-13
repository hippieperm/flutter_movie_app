import 'package:dio/dio.dart';
import 'movie_data_source.dart';
import '../dto/movie_detail_dto/movie_detail_dto.dart';
import '../dto/movie_response_dto/movie_response_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final Dio _dio;

  MovieDataSourceImpl(this._dio);

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    try {
      final response = await _dio.get(
        'movie/$id',
        queryParameters: {'language': 'ko-KR'},
      );

      if (response.statusCode == 200 && response.data != null) {
        return MovieDetailDto.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      print('Error fetching movie detail: ${e.message}');
      return null;
    } catch (e) {
      print('Unexpected error in fetchMovieDetail: $e');
      return null;
    }
  }

  @override
  Future<MovieResponseDto?> fetchNowPlayingMovies() {
    // TODO: implement fetchNowPlayingMovies
    throw UnimplementedError();
  }

  @override
  Future<MovieResponseDto?> fetchPopularMovies() {
    // TODO: implement fetchPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() {
    // TODO: implement fetchTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() {
    // TODO: implement fetchUpcomingMovies
    throw UnimplementedError();
  }
}
