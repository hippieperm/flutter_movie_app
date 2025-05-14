// To parse this JSON data, do
//
//     final movieDetailDto = movieDetailDtoFromJson(jsonString);

import 'dart:convert';

MovieDetailDto movieDetailDtoFromJson(String str) =>
    MovieDetailDto.fromJson(json.decode(str));

String movieDetailDtoToJson(MovieDetailDto data) => json.encode(data.toJson());

class MovieDetailDto {
  final bool adult;
  final String? backdropPath;
  final dynamic belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String? overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final DateTime releaseDate;
  final int revenue;
  final int? runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String? tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDetailDto({
    required this.adult,
    this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    this.runtime,
    required this.spokenLanguages,
    required this.status,
    this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailDto.fromJson(Map<String, dynamic> json) {
    try {
      final rawTagline = json["tagline"];
      print('DTO에서 처리 전 tagline: "$rawTagline", 타입: ${rawTagline.runtimeType}');

      // 태그라인이 빈 문자열인 경우 null로 처리
      final tagline = (rawTagline == "") ? null : rawTagline;
      print('DTO에서 처리 후 tagline: "$tagline", 타입: ${tagline?.runtimeType}');

      return MovieDetailDto(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"] ?? 0,
        genres: json["genres"] != null
            ? List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x)))
            : [],
        homepage: json["homepage"],
        id: json["id"] ?? 0,
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"] ?? '',
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"],
        popularity: (json["popularity"] ?? 0).toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: json["production_companies"] != null
            ? List<ProductionCompany>.from(
                json["production_companies"].map(
                  (x) => ProductionCompany.fromJson(x),
                ),
              )
            : [],
        productionCountries: json["production_countries"] != null
            ? List<ProductionCountry>.from(
                json["production_countries"].map(
                  (x) => ProductionCountry.fromJson(x),
                ),
              )
            : [],
        releaseDate: json["release_date"] != null
            ? DateTime.tryParse(json["release_date"]) ?? DateTime.now()
            : DateTime.now(),
        revenue: json["revenue"] ?? 0,
        runtime: json["runtime"],
        spokenLanguages: json["spoken_languages"] != null
            ? List<SpokenLanguage>.from(
                json["spoken_languages"].map(
                  (x) => SpokenLanguage.fromJson(x),
                ),
              )
            : [],
        status: json["status"] ?? '',
        tagline: tagline,
        title: json["title"] ?? '',
        video: json["video"] ?? false,
        voteAverage: (json["vote_average"] ?? 0).toDouble(),
        voteCount: json["vote_count"] ?? 0,
      );
    } catch (e) {
      print('MovieDetailDto 파싱 중 오류: $e');
      // 최소한의 데이터로 객체 생성
      return MovieDetailDto(
        adult: false,
        belongsToCollection: null,
        budget: 0,
        genres: [],
        id: 0,
        originalLanguage: '',
        originalTitle: '',
        popularity: 0.0,
        productionCompanies: [],
        productionCountries: [],
        releaseDate: DateTime.now(),
        revenue: 0,
        spokenLanguages: [],
        status: '',
        title: '데이터 로드 실패',
        video: false,
        voteAverage: 0.0,
        voteCount: 0,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": List<dynamic>.from(
          productionCompanies.map((x) => x.toJson()),
        ),
        "production_countries": List<dynamic>.from(
          productionCountries.map((x) => x.toJson()),
        ),
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": List<dynamic>.from(
          spokenLanguages.map((x) => x.toJson()),
        ),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    try {
      return Genre(id: json["id"] ?? 0, name: json["name"] ?? '');
    } catch (e) {
      return Genre(id: 0, name: '알 수 없음');
    }
  }

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class ProductionCompany {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompany({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    try {
      return ProductionCompany(
        id: json["id"] ?? 0,
        logoPath: json["logo_path"],
        name: json["name"] ?? '',
        originCountry: json["origin_country"] ?? '',
      );
    } catch (e) {
      return ProductionCompany(id: 0, name: '알 수 없음', originCountry: '');
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}

class ProductionCountry {
  final String iso31661;
  final String name;

  ProductionCountry({required this.iso31661, required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    try {
      return ProductionCountry(
        iso31661: json["iso_3166_1"] ?? '',
        name: json["name"] ?? '',
      );
    } catch (e) {
      return ProductionCountry(iso31661: '', name: '알 수 없음');
    }
  }

  Map<String, dynamic> toJson() => {"iso_3166_1": iso31661, "name": name};
}

class SpokenLanguage {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    try {
      return SpokenLanguage(
        englishName: json["english_name"] ?? '',
        iso6391: json["iso_639_1"] ?? '',
        name: json["name"] ?? '',
      );
    } catch (e) {
      return SpokenLanguage(englishName: '', iso6391: '', name: '알 수 없음');
    }
  }

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
