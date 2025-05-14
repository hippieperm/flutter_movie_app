// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/di/providers.dart';
import 'package:flutter_movie_app/presentation/view/widget/detail/genre_chip.dart';
import 'package:flutter_movie_app/presentation/view/widget/detail/hero_image.dart';
import 'package:flutter_movie_app/presentation/view/widget/detail/production_company_logo.dart';
import 'package:flutter_movie_app/presentation/view/widget/detail/stat_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
    final state = ref.watch(detailViewModelProvider(movieId));

    return Scaffold(
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(child: Text('Error: ${state.error}'))
              : state.movieDetail == null
                  ? const Center(child: Text('영화 정보를 불러올 수 없습니다.'))
                  : CustomScrollView(
                      slivers: [
                        // 영화 포스터
                        SliverAppBar(
                          expandedHeight: 450,
                          pinned: true,
                          backgroundColor: Colors.black,
                          flexibleSpace: FlexibleSpaceBar(
                            background: HeroImage(
                              movieId: state.movieDetail!.id,
                              imageUrl: state.movieDetail!.fullPosterPath,
                              heroTag: heroTag,
                            ),
                          ),
                        ),

                        // 영화 정보
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 영화 제목 및 개봉일
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        state.movieDetail!.title,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      DateFormat(
                                        'yyyy-MM-dd',
                                      ).format(state.movieDetail!.releaseDate),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
    );
  }
}
