import 'package:flutter_movie_app/core/network/dio_provider.dart';
import 'package:flutter_movie_app/data/datasource/movie_data_source.dart';
import 'package:flutter_movie_app/data/datasource/movie_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return MovieDataSourceImpl(dio);
});
