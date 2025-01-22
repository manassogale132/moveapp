part of 'movie_info_bloc.dart';

sealed class MovieInfoEvent extends Equatable {
  const MovieInfoEvent();

  @override
  List<Object> get props => [];
}

final class FetchMovieInfoEvent extends MovieInfoEvent {
  const FetchMovieInfoEvent();

  @override
  String toString() {
    return 'FetchMovieInfoEvent{}';
  }
}

final class ToggleFavoriteEvent extends MovieInfoEvent {
  final Map<String, dynamic> movie;

  const ToggleFavoriteEvent({required this.movie});

  @override
  List<Object> get props => [movie];
}

class SearchMoviesEvent extends MovieInfoEvent {
  final String query;
  const SearchMoviesEvent({required this.query});
}
