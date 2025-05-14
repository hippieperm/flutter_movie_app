import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../domain/entity/movie.dart';
import '../../detail_page.dart';

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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              movieId: movie.id,
              heroTag: heroTag,
            ),
          ),
        );
      },
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
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              height: 450,
              color: Colors.grey.shade800,
              child: const Center(
                child: Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
