import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';

class FeatureMovie extends StatelessWidget {
  final Movie movie;

  const FeatureMovie({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final heroTag = 'main_feature_${movie.id}';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {},
        child: Hero(
          tag: heroTag,
          child: CachedNetworkImage(
            imageUrl: movie.fullPosterPath,
          ),
        ),
      ),
    );
  }
}
