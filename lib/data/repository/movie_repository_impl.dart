import 'package:flutter_movie_app/domain/entity/movie_detail.dart';

import '../datasource/movie_data_source.dart';
import '../../domain/entity/movie.dart';
import '../../domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _dataSource;

  MovieRepositoryImpl(this._dataSource);

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final response = await _dataSource.fetchNowPlayingMovies();
    if (response == null) return null;

    return response.results
        .map(
          (result) => Movie(
            id: result.id,
            posterPath: result.posterPath,
            title: result.title,
            voteAverage: result.voteAverage,
            releaseDate: result.releaseDate,
            overview: result.overview,
          ),
        )
        .toList();
  }

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) {
    // TODO: implement fetchMovieDetail
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() {
    // TODO: implement fetchPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() {
    // TODO: implement fetchTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() {
    // TODO: implement fetchUpcomingMovies
    throw UnimplementedError();
  }
}
