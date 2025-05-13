import 'package:flutter_movie_app/domain/entity/movie_detail.dart';

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
