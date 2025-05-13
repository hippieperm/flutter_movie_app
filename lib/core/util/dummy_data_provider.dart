import '../../domain/entity/movie.dart';
import '../../domain/entity/movie_detail.dart';

/// API 연결에 문제가 있을 때 사용할 더미 데이터를 제공하는 클래스
class DummyDataProvider {
  /// 영화 목록 더미 데이터
  static List<Movie> getDummyMovies() {
    return [
      Movie(
        id: 1,
        posterPath: '/path/to/dummy/poster.jpg',
        title: 'API 키를 확인해주세요',
        voteAverage: 0.0,
        releaseDate: DateTime.now(),
        overview: 'TMDB API 키를 확인하고 앱을 다시 실행해주세요.',
      ),
      Movie(
        id: 2,
        posterPath: '/path/to/dummy/poster2.jpg',
        title: '샘플 영화 2',
        voteAverage: 7.5,
        releaseDate: DateTime.now(),
        overview: '이 영화는 API 오류 발생 시 보여주는 샘플 영화입니다.',
      ),
      Movie(
        id: 3,
        posterPath: '/path/to/dummy/poster3.jpg',
        title: '샘플 영화 3',
        voteAverage: 8.1,
        releaseDate: DateTime.now(),
        overview: '이 영화는 API 오류 발생 시 보여주는 샘플 영화입니다.',
      ),
    ];
  }

  /// 영화 상세 정보 더미 데이터
  static MovieDetail getDummyMovieDetail(int id) {
    return MovieDetail(
      id: id,
      title: 'API 키를 확인해주세요',
      overview: 'TMDB API 키를 확인하고 앱을 다시 실행해주세요.',
      budget: 0,
      genres: ['액션', '드라마'],
      popularity: 0.0,
      productionCompanyLogos: [],
      releaseDate: DateTime.now(),
      revenue: 0,
      runtime: 120,
      tagline: '테스트 태그라인',
      voteAverage: 0.0,
      voteCount: 0,
      posterPath: '/path/to/dummy/poster.jpg',
    );
  }
}
