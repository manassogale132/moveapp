import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:move_app/code/models/movie_list_model.dart';
import 'package:move_app/code/service/movie_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

part 'movie_info_event.dart';
part 'movie_info_state.dart';
part 'movie_info_bloc.freezed.dart';

class MovieInfoBloc extends Bloc<MovieInfoEvent, MovieInfoState> {
  MovieInfoBloc() : super(MovieInfoState.initial()) {
    on<FetchMovieInfoEvent>(_onFetchMovieInfoEvent);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
    on<SearchMoviesEvent>(_onSearchMovies);
    _loadFavorites();
  }

  Future<void> _onFetchMovieInfoEvent(
    FetchMovieInfoEvent event,
    Emitter<MovieInfoState> emit,
  ) async {
    try {
      emit(state.copyWith(movieInfoStatus: MovieInfoStatus.submitting));

      final movieService = MovieService();
      final movieList = await movieService.getPopularMovies();

      emit(state.copyWith(
        movieInfoStatus: MovieInfoStatus.submitted,
        movieListModel: movieList,
      ));
    } on DioException catch (e) {
      emit(state.copyWith(
        movieInfoStatus: MovieInfoStatus.error,
        error: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        movieInfoStatus: MovieInfoStatus.error,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavoriteEvent event,
    Emitter<MovieInfoState> emit,
  ) async {
    final currentFavorites =
        List<Map<String, dynamic>>.from(state.favoriteMovies);
    final movieIndex = currentFavorites.indexWhere(
      (m) => m['title'] == event.movie['title'],
    );

    if (movieIndex >= 0) {
      currentFavorites.removeAt(movieIndex);
    } else {
      currentFavorites.add(event.movie);
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('favorites', jsonEncode(currentFavorites));

    emit(state.copyWith(favoriteMovies: currentFavorites));
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getString('favorites');
    if (favoritesJson != null) {
      final favorites = List<Map<String, dynamic>>.from(
        jsonDecode(favoritesJson).map((x) => Map<String, dynamic>.from(x)),
      );
      emit(state.copyWith(favoriteMovies: favorites));
    }
  }

  void _onSearchMovies(
    SearchMoviesEvent event,
    Emitter<MovieInfoState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query));
  }
}
