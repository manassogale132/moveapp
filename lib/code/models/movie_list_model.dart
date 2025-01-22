import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'movie_list_model.freezed.dart';
part 'movie_list_model.g.dart';

@freezed
class MovieListModel with _$MovieListModel {
  const factory MovieListModel({
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'results') List<Results>? results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _MovieListModel;

  factory MovieListModel.fromJson(Map<String, Object?> json) =>
      _$MovieListModelFromJson(json);
}

@freezed
class Results with _$Results {
  const factory Results({
    @JsonKey(name: 'adult') bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'popularity') double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'video') bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _Results;

  factory Results.fromJson(Map<String, Object?> json) =>
      _$ResultsFromJson(json);
}
