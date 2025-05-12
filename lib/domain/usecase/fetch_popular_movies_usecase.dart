import '../entity/movie.dart';
import '../repository/movie_repository.dart';

class FetchPopularMoviesUseCase {
  final MovieRepository _repository;

  FetchPopularMoviesUseCase(this._repository);

  Future<List<Movie>?> call() => _repository.fetchPopularMovies();
}
