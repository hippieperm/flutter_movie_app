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

    return GestureDetector(
      onTap: () {},
      child: Hero(
        tag: heroTag,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: movie.fullPosterPath,
            height: 450,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              height: 450,
              color: Colors.grey.shade800,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
