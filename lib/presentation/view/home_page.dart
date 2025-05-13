import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/di/providers.dart';
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
                          if (state.popularMovies != null &&
                              state.popularMovies!.isNotEmpty)
                            GestureDetector(
                              onTap: () {},
                            )
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
