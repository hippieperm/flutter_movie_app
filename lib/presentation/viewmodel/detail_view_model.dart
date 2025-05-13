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
}
