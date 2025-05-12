import '../entity/movie_detail.dart';
import '../repository/movie_repository.dart';

class FetchMovieDetailUseCase {
  final MovieRepository _repository;

  FetchMovieDetailUseCase(this._repository);

  Future<MovieDetail?> call(int id) => _repository.fetchMovieDetail(id);
}
