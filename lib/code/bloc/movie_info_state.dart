part of 'movie_info_bloc.dart';

enum MovieInfoStatus {
  initial,
  submitting,
  submitted,
  error,
}

@freezed
class MovieInfoState with _$MovieInfoState {
  const factory MovieInfoState({
    @Default(MovieInfoStatus.initial) MovieInfoStatus? movieInfoStatus,
    @Default(false) bool? isDarkMode,
    MovieListModel? movieListModel,
    @Default([]) List<Results>? results,
    @Default([]) List<Map<String, dynamic>> favoriteMovies,
    @Default("") String searchQuery,
    Results? resultsData,
    @Default("") String error,
  }) = _MovieInfoState;

  factory MovieInfoState.initial() => const MovieInfoState();
}
