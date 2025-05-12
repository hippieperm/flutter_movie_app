import '../entity/movie.dart';
import '../repository/movie_repository.dart';

class FetchUpcomingMoviesUseCase {
  final MovieRepository _repository;

  FetchUpcomingMoviesUseCase(this._repository);

  Future<List<Movie>?> call() => _repository.fetchUpcomingMovies();
}
