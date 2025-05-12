import '../entity/movie.dart';
import '../repository/movie_repository.dart';

class FetchNowPlayingMoviesUseCase {
  final MovieRepository _repository;

  FetchNowPlayingMoviesUseCase(this._repository);

  Future<List<Movie>?> call() => _repository.fetchNowPlayingMovies();
}
