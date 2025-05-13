// To parse this JSON data, do
//
//     final movieResponseDto = movieResponseDtoFromJson(jsonString);

import 'dart:convert';

MovieResponseDto movieResponseDtoFromJson(String str) =>
    MovieResponseDto.fromJson(json.decode(str));

String movieResponseDtoToJson(MovieResponseDto data) =>
    json.encode(data.toJson());

class MovieResponseDto {
  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  MovieResponseDto({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponseDto.fromJson(Map<String, dynamic> json) {
    try {
      return MovieResponseDto(
        page: json["page"] ?? 1,
        results:
            json["results"] != null
                ? List<Result>.from(
                  json["results"].map((x) => Result.fromJson(x)),
                )
                : [],
        totalPages: json["total_pages"] ?? 1,
        totalResults: json["total_results"] ?? 0,
      );
    } catch (e) {
      print('MovieResponseDto 파싱 중 오류: $e');
      // 최소한의 데이터로 객체 생성
      return MovieResponseDto(
        page: 1,
        results: [],
        totalPages: 1,
        totalResults: 0,
      );
    }
  }

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Result({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    try {
      return Result(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"],
        genreIds:
            json["genre_ids"] != null
                ? List<int>.from(json["genre_ids"].map((x) => x))
                : [],
        id: json["id"] ?? 0,
        originalLanguage: json["original_language"] ?? '',
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"] ?? '',
        popularity: (json["popularity"] ?? 0).toDouble(),
        posterPath: json["poster_path"],
        releaseDate:
            json["release_date"] == null || json["release_date"] == ""
                ? null
                : DateTime.tryParse(json["release_date"]),
        title: json["title"] ?? '',
        video: json["video"] ?? false,
        voteAverage: (json["vote_average"] ?? 0).toDouble(),
        voteCount: json["vote_count"] ?? 0,
      );
    } catch (e) {
      print('Result 파싱 중 오류: $e');
      // 기본 데이터로 객체 생성
      return Result(
        adult: false,
        genreIds: [],
        id: 0,
        originalLanguage: '',
        originalTitle: '',
        overview: '파싱 오류',
        popularity: 0.0,
        title: '파싱 오류',
        video: false,
        voteAverage: 0.0,
        voteCount: 0,
      );
    }
  }

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date":
        releaseDate == null
            ? null
            : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}
