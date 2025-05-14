// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/di/providers.dart';
import 'package:flutter_movie_app/presentation/view/widget/detail/genre_chip.dart';
import 'package:flutter_movie_app/presentation/view/widget/detail/production_company_logo.dart';
import 'package:flutter_movie_app/presentation/view/widget/detail/stat_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
      body: Stack(
        children: [
          // Hero 애니메이션을 위한 기본 구조 - 항상 존재
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 450,
                pinned: true,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: heroTag ?? 'movie_$movieId',
                    child: Material(
                      type: MaterialType.transparency,
                      child: state.movieDetail != null
                          ? CachedNetworkImage(
                              imageUrl: state.movieDetail!.fullPosterPath,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: Colors.grey.shade800,
                                child: const Center(
                                    child: CircularProgressIndicator()),
                              ),
                              errorWidget: (context, url, error) => Container(
                                color: Colors.grey.shade800,
                                child: const Center(child: Icon(Icons.error)),
                              ),
                            )
                          : Container(
                              color: Colors.grey.shade800,
                              child: const Center(
                                  child: CircularProgressIndicator()),
                            ),
                    ),
                  ),
                ),
              ),
              if (!state.isLoading &&
                  state.error == null &&
                  state.movieDetail != null)
                // 영화 정보
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 영화 제목 및 개봉일
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        const SizedBox(height: 12),

                        // 태그라인
                        Builder(builder: (context) {
                          final tagline = state.movieDetail!.tagline;
                          print('DetailPage에서 태그라인: "$tagline"');
                          print('태그라인 null 여부: ${tagline == null}');
                          print('태그라인 빈 문자열 여부: ${tagline == ""}');
                          print('태그라인 길이: ${tagline?.length}');

                          if (tagline != null && tagline.trim().isNotEmpty) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tagline,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.blue.shade300,
                                  ),
                                ),
                                const SizedBox(height: 12),
                              ],
                            );
                          }
                          return const SizedBox.shrink();
                        }),

                        // 러닝타임
                        if (state.movieDetail!.runtime != null)
                          Text(
                            '러닝타임: ${state.movieDetail!.runtime} 분',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        const SizedBox(height: 16),

                        // 카테고리들
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: state.movieDetail!.genres
                              .map((genre) => GenreChip(genre: genre))
                              .toList(),
                        ),
                        const SizedBox(height: 16),

                        // 영화 설명
                        Text(
                          state.movieDetail!.overview,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // 영화 통계 정보 (가로 스크롤)
                        const Text(
                          '흥행정보',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              StatItem(
                                label: '평점',
                                value: state.movieDetail!.voteAverage
                                    .toStringAsFixed(1),
                              ),
                              StatItem(
                                label: '평점투표수',
                                value: NumberFormat(
                                  '#,###',
                                ).format(state.movieDetail!.voteCount),
                              ),
                              StatItem(
                                label: '인기점수',
                                value: NumberFormat(
                                  '#,###.#',
                                ).format(state.movieDetail!.popularity),
                              ),
                              StatItem(
                                label: '예산',
                                value:
                                    '\$${NumberFormat('#,###').format(state.movieDetail!.budget)}',
                              ),
                              StatItem(
                                label: '수익',
                                value:
                                    '\$${NumberFormat('#,###').format(state.movieDetail!.revenue)}',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // 제작사 로고
                        if (state.movieDetail!.productionCompanyLogos
                            .isNotEmpty) ...[
                          const Text(
                            '제작사',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 60,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state
                                  .movieDetail!.productionCompanyLogos.length,
                              itemBuilder: (context, index) {
                                return ProductionCompanyLogo(
                                  logoUrl: state.movieDetail!
                                      .productionCompanyLogos[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
            ],
          ),
          if (state.isLoading) const Center(child: CircularProgressIndicator()),
          if (state.error != null) Center(child: Text('Error: ${state.error}')),
        ],
      ),
    );
  }
}
