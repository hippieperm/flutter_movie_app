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

    return Container();
  }
}
