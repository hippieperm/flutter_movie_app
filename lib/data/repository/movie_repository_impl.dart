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
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final response = await _dataSource.fetchMovieDetail(id);
    if (response == null) return null;

    // 제작사 로고 URL 리스트 변환
    final productionCompanyLogos = response.productionCompanies
        .where((company) => company.logoPath != null)
        .map(
          (company) => 'https://image.tmdb.org/t/p/w500${company.logoPath}',
        )
        .toList();

    // 장르 이름만 추출
    final genres = response.genres.map((genre) => genre.name).toList();

    return MovieDetail(
      id: response.id,
      title: response.title,
      overview: response.overview ?? '',
      budget: response.budget,
      genres: genres,
      popularity: response.popularity,
      posterPath: response.posterPath,
      productionCompanyLogos: productionCompanyLogos,
      releaseDate: response.releaseDate,
      revenue: response.revenue,
      runtime: response.runtime,
      tagline: response.tagline,
      voteAverage: response.voteAverage,
      voteCount: response.voteCount,
    );
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() async {
    final response = await _dataSource.fetchPopularMovies();
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
