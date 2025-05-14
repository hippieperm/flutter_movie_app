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
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length > 20 ? 20 : movies.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {},
          ),
        )
      ],
    );
  }
}
