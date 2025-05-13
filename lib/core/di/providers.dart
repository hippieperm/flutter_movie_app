import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return MovieDataSourceImpl(dio);
});
