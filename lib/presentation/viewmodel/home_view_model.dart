import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_now_playing_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_top_rated_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecase/fetch_upcoming_movies_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  HomeState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upcomingMovies,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class HomeViewModel extends StateNotifier<HomeState> {
  final FetchNowPlayingMoviesUseCase _fetchNowPlayingMoviesUseCase;
  final FetchPopularMoviesUseCase _fetchPopularMoviesUseCase;
  final FetchTopRatedMoviesUseCase _fetchTopRatedMoviesUseCase;
  final FetchUpcomingMoviesUseCase _fetchUpcomingMoviesUseCase;

  HomeViewModel(
    this._fetchNowPlayingMoviesUseCase,
    this._fetchPopularMoviesUseCase,
    this._fetchTopRatedMoviesUseCase,
    this._fetchUpcomingMoviesUseCase,
  ) : super(HomeState.initial()) {
    fetchAllMovies();
  }

  Future<void> fetchAllMovies() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final nowPlayingMovies = await _fetchNowPlayingMoviesUseCase();
      final popularMovies = await _fetchPopularMoviesUseCase();
      final topRatedMovies = await _fetchTopRatedMoviesUseCase();
      final upcomingMovies = await _fetchUpcomingMoviesUseCase();

      state = state.copyWith(
        nowPlayingMovies: nowPlayingMovies,
        popularMovies: popularMovies,
        topRatedMovies: topRatedMovies,
        upcomingMovies: upcomingMovies,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> refreshData() async {
    state = state.copyWith(isLoading: true);
    await fetchAllMovies();
  }
}
