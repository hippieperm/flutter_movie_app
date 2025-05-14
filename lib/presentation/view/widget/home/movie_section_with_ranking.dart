import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';

class MovieSectionWithRanking extends StatelessWidget {
  final String title;
  final List<Movie> movies;

  const MovieSectionWithRanking({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    const String sectionId = "popular_ranking";

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
      ],
    );
  }
}
