import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final int movieId;
  final String imageUrl;
  final String? heroTag;

  const HeroImage({
    super.key,
    required this.movieId,
    required this.imageUrl,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag ?? 'movie_$movieId',
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey.shade800,
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey.shade800,
          child: const Center(child: Icon(Icons.error)),
        ),
      ),
    );
  }
}
