class Movie {
  final int id;
  final String? posterPath;
  final String title;
  final double voteAverage;
  final DateTime? releaseDate;
  final String overview;

  Movie({
    required this.id,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
    this.releaseDate,
    required this.overview,
  });

  String get fullPosterPath =>
      posterPath != null
          ? 'https://image.tmdb.org/t/p/w500$posterPath'
          : 'https://via.placeholder.com/500x750?text=No+Image';
}
