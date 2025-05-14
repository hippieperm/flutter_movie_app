import '../../domain/entity/movie_detail.dart';
import '../../domain/usecase/fetch_movie_detail_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailState {
  final MovieDetail? movieDetail;
  final bool isLoading;
  final String? error;

  DetailState({
    this.movieDetail,
    this.isLoading = false,
    this.error,
  });

  factory DetailState.initial() =>
      DetailState(movieDetail: null, isLoading: false, error: null);

  DetailState copyWith({
    MovieDetail? movieDetail,
    bool? isLoading,
    String? error,
  }) {
    return DetailState(
      movieDetail: movieDetail ?? this.movieDetail,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class DetailViewModel extends StateNotifier<DetailState> {
  final FetchMovieDetailUseCase _fetchMovieDetailUseCase;

  DetailViewModel(this._fetchMovieDetailUseCase) : super(DetailState.initial());

  Future<void> fetchMovieDetail(int id) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final movieDetail = await _fetchMovieDetailUseCase(id);
      state = state.copyWith(movieDetail: movieDetail, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
