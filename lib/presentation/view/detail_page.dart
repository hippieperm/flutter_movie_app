// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  final int movieId;
  final String? heroTag;

  const DetailPage({
    super.key,
    required this.movieId,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold();
  }
}
