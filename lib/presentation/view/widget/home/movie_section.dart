import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final List<Movie> movies;

  const MovieSection({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
