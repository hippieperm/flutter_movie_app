import 'package:flutter_movie_app/core/network/dio_provider.dart';
import 'package:flutter_movie_app/data/datasource/movie_data_source.dart';
import 'package:flutter_movie_app/data/datasource/movie_data_source_impl.dart';
import 'package:flutter_movie_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_movie_detail_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_top_rated_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_upcoming_movies_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return MovieDataSourceImpl(dio);
});

// Repository
final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dataSource = ref.watch(movieDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});

// Use Cases
final fetchNowPlayingMoviesUseCaseProvider =
    Provider<FetchNowPlayingMoviesUseCase>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return FetchNowPlayingMoviesUseCase(repository);
});

final fetchPopularMoviesUseCaseProvider = Provider<FetchPopularMoviesUseCase>((
  ref,
) {
  final repository = ref.watch(movieRepositoryProvider);
  return FetchPopularMoviesUseCase(repository);
});

final fetchTopRatedMoviesUseCaseProvider = Provider<FetchTopRatedMoviesUseCase>(
  (ref) {
    final repository = ref.watch(movieRepositoryProvider);
    return FetchTopRatedMoviesUseCase(repository);
  },
);

final fetchUpcomingMoviesUseCaseProvider = Provider<FetchUpcomingMoviesUseCase>(
  (ref) {
    final repository = ref.watch(movieRepositoryProvider);
    return FetchUpcomingMoviesUseCase(repository);
  },
);

final fetchMovieDetailUseCaseProvider = Provider<FetchMovieDetailUseCase>((
  ref,
) {
  final repository = ref.watch(movieRepositoryProvider);
  return FetchMovieDetailUseCase(repository);
});
