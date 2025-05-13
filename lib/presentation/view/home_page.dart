import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/di/providers.dart';
import 'package:flutter_movie_app/presentation/view/widget/home/feature_movie.dart';
import 'package:flutter_movie_app/presentation/view/widget/home/movie_section.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : state.error != null
                ? Center(child: Text('Error: ${state.error}'))
                : RefreshIndicator(
                    onRefresh: () =>
                        ref.read(homeViewModelProvider.notifier).refreshData(),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          if (state.popularMovies != null &&
                              state.popularMovies!.isNotEmpty)
                            FeatureMovie(movie: state.popularMovies!.first),
                          const SizedBox(height: 20),
                          MovieSection(
                            title: '현재 상영중',
                            movies: state.nowPlayingMovies ?? [],
                          ),
                          const SizedBox(height: 20),
                          MovieSection(
                            title: '평점 높은순',
                            movies: state.topRatedMovies ?? [],
                          ),
                          const SizedBox(height: 20),
                          MovieSection(
                            title: '개봉예정',
                            movies: state.upcomingMovies ?? [],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
