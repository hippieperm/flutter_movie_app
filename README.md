# 🎬 Flutter Movie App

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-2.4.9-0A84FF?style=for-the-badge)
![TMDB API](https://img.shields.io/badge/TMDB_API-v3-01D277?style=for-the-badge)

Flutter Movie App은 TMDB API를 활용한 클린 아키텍처 기반 영화 정보 애플리케이션입니다. 인기 영화, 현재 상영작, 개봉 예정작 등 다양한 카테고리의 영화 정보를 제공하며 세련된 UI와 부드러운 애니메이션을 갖추고 있습니다.

## ✨ 주요 기능

- 🔥 **인기 영화 및 다양한 카테고리** - 현재 상영작, 평점 높은 영화, 개봉 예정작 탐색
- 🎯 **영화 상세 정보** - 줄거리, 평점, 개봉일, 장르, 예산 및 수익 정보 제공
- 🚀 **매끄러운 UI/UX** - Hero 애니메이션을 활용한 부드러운 화면 전환
- 🔄 **Pull-to-Refresh** - 최신 영화 정보 업데이트
- 🌙 **다크 모드** - 어두운 테마로 눈의 피로 감소
- 📱 **반응형 디자인** - 다양한 화면 크기 지원

## 📱 스크린샷

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/1f11f8fd-7291-4d55-9563-0c55838a41aa" alt="홈 화면"/></td>
    <td><img src="https://github.com/user-attachments/assets/28dbf124-182e-4afe-bcd3-4087281e8326" alt="영화 상세"/></td>
    <td><img src="https://github.com/user-attachments/assets/a672a473-939a-460c-b804-cbfff72643f1" alt="카테고리"/></td>


</table>


## 🏗️ 아키텍처

이 프로젝트는 **클린 아키텍처**와 **MVVM 패턴**을 기반으로 개발되었습니다:

```
lib/
├── core/
│   ├── di/          # 의존성 주입 (Riverpod 프로바이더)
│   ├── network/     # 네트워크 구성 (Dio 설정)
│   └── util/        # 유틸리티 함수
├── data/
│   ├── datasource/  # 데이터 소스 구현
│   ├── dto/         # 데이터 전송 객체
│   └── repository/  # 리포지토리 구현
├── domain/
│   ├── entity/      # 도메인 엔티티
│   ├── repository/  # 리포지토리 인터페이스
│   └── usecase/     # 유스케이스
└── presentation/
    ├── view/        # UI 화면 및 위젯
    └── viewmodel/   # 뷰모델(상태 관리)
```

## 🛠️ 기술 스택

- **상태 관리**: [Flutter Riverpod](https://riverpod.dev/)
- **네트워크**: [Dio](https://pub.dev/packages/dio)
- **이미지 캐싱**: [CachedNetworkImage](https://pub.dev/packages/cached_network_image)
- **환경 변수**: [Flutter Dotenv](https://pub.dev/packages/flutter_dotenv)
- **날짜 포맷팅**: [Intl](https://pub.dev/packages/intl)

## 🌟 특별한 기능 구현

### Hero 애니메이션 최적화

홈 화면에서 상세 화면으로 이동할 때 부드러운 Hero 애니메이션을 구현했습니다. 가드 패턴(Guard Pattern)으로 인한 애니메이션 깨짐 현상을 Stack 위젯을 활용해 해결했습니다:

```dart
body: Stack(
  children: [
    // Hero 애니메이션을 위한 기본 구조 - 항상 존재
    CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: heroTag ?? 'movie_$movieId',
              child: /* 이미지 위젯 */,
            ),
          ),
        ),
        // 내용...
      ],
    ),
    // 로딩 상태나 에러는 오버레이로 표시
    if (isLoading) CircularProgressIndicator(),
  ],
),
```

### 클린 아키텍처 적용

데이터 흐름을 명확하게 하고 테스트 용이성을 높이기 위해 클린 아키텍처를 적용했습니다:

1. **Data Layer**: API 통신 및 데이터 매핑
2. **Domain Layer**: 비즈니스 로직과 엔티티 정의
3. **Presentation Layer**: UI 및 상태 관리

## 🚀 시작하기

### 전제 조건

- Flutter 3.0 이상
- Dart 3.0 이상
- [TMDB API 키](https://www.themoviedb.org/documentation/api)

### 설치 및 실행

1. 저장소 클론
```bash
git clone https://github.com/yourusername/flutter_movie_app.git
cd flutter_movie_app
```

2. 의존성 설치
```bash
flutter pub get
```

3. `.env` 파일 생성 및 API 키 설정
```
TMDB_API_KEY=your_api_key_here
```

4. 앱 실행
```bash
flutter run
```

## 📝 라이선스

이 프로젝트는 MIT 라이선스 하에 제공됩니다.

## 👏 감사의 말

- [TMDB](https://www.themoviedb.org/) - 영화 데이터 API 제공
- Flutter 및 Dart 팀 - 멋진 프레임워크 개발
- 커뮤니티에 기여하는 모든 오픈 소스 패키지 개발자들

---

⭐ 이 프로젝트가 마음에 드셨다면 Star를 눌러주세요! ⭐

## 🔮 앞으로의 계획

- [ ] 검색 기능 추가
- [ ] 영화 예고편 재생 기능
- [ ] 사용자 인증 및 즐겨찾기 기능
- [ ] 오프라인 모드 지원
- [ ] 테마 커스터마이징

---

이 앱은 [TMDB API](https://www.themoviedb.org/)를 사용하지만 TMDB에서 보증하거나 인증하지 않습니다.
