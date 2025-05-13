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
  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    try {
      final response = await _dio.get(
        'movie/now_playing',
        queryParameters: {'language': 'ko-KR', 'page': 1},
      );

      if (response.statusCode == 200 && response.data != null) {
        print('API 응답 데이터 구조: ${response.data.runtimeType}');
        return MovieResponseDto.fromJson(response.data);
      } else {
        print('API 응답이 비어있거나 성공적이지 않습니다: ${response.statusCode}');
        return null;
      }
    } on DioException catch (e) {
      print('Error fetching now playing movies: ${e.message}');
      print('Status code: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');
      return null;
    } catch (e) {
      print('Unexpected error in fetchNowPlayingMovies: $e');
      return _createDummyMovieResponse();
    }
  }

  @override
  Future<MovieResponseDto?> fetchPopularMovies() async {
    try {
      final response = await _dio.get(
        'movie/popular',
        queryParameters: {'language': 'ko-KR', 'page': 1},
      );

      if (response.statusCode == 200 && response.data != null) {
        return MovieResponseDto.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      print('Error fetching popular movies: ${e.message}');
      return null;
    } catch (e) {
      print('Unexpected error in fetchPopularMovies: $e');
      return _createDummyMovieResponse();
    }
  }

  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() async {
    try {
      final response = await _dio.get(
        'movie/top_rated',
        queryParameters: {'language': 'ko-KR', 'page': 1},
      );

      if (response.statusCode == 200 && response.data != null) {
        return MovieResponseDto.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      print('Error fetching top rated movies: ${e.message}');
      return null;
    } catch (e) {
      print('Unexpected error in fetchTopRatedMovies: $e');
      return _createDummyMovieResponse();
    }
  }

  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() {
    // TODO: implement fetchUpcomingMovies
    throw UnimplementedError();
  }

  // API가 실패할 경우 사용할 더미 데이터
  MovieResponseDto _createDummyMovieResponse() {
    return MovieResponseDto(
      page: 1,
      results: [
        Result(
          adult: false,
          genreIds: [28, 12, 14],
          id: 1,
          originalLanguage: "en",
          originalTitle: "샘플 영화",
          overview: "API 연결에 문제가 발생했습니다. TMDB API 키를 확인해주세요.",
          popularity: 100.0,
          title: "API 키를 확인해주세요",
          video: false,
          voteAverage: 7.5,
          voteCount: 1000,
        ),
      ],
      totalPages: 1,
      totalResults: 1,
    );
  }
}
