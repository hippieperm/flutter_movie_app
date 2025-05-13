import 'package:flutter_movie_app/domain/entity/movie.dart';

class HomeState {
  final List<Movie>? nowPlayingMovies;
  final List<Movie>? popularMovies;
  final List<Movie>? topRatedMovies;
  final List<Movie>? upcomingMovies;
  final bool isLoading;
  final String? error;

  HomeState({
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
    required this.isLoading,
    required this.error,
  });

  factory HomeState.initial() => HomeState(
        nowPlayingMovies: null,
        popularMovies: null,
        topRatedMovies: null,
        upcomingMovies: null,
        isLoading: false,
        error: null,
      );
}
