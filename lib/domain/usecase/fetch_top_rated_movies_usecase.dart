import '../entity/movie.dart';
import '../repository/movie_repository.dart';

class FetchTopRatedMoviesUseCase {
  final MovieRepository _repository;

  FetchTopRatedMoviesUseCase(this._repository);

  Future<List<Movie>?> call() => _repository.fetchTopRatedMovies();
}
