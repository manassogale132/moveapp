// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieInfoState {
  MovieInfoStatus? get movieInfoStatus => throw _privateConstructorUsedError;
  bool? get isDarkMode => throw _privateConstructorUsedError;
  MovieListModel? get movieListModel => throw _privateConstructorUsedError;
  List<Results>? get results => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get favoriteMovies =>
      throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  Results? get resultsData => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  /// Create a copy of MovieInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieInfoStateCopyWith<MovieInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieInfoStateCopyWith<$Res> {
  factory $MovieInfoStateCopyWith(
          MovieInfoState value, $Res Function(MovieInfoState) then) =
      _$MovieInfoStateCopyWithImpl<$Res, MovieInfoState>;
  @useResult
  $Res call(
      {MovieInfoStatus? movieInfoStatus,
      bool? isDarkMode,
      MovieListModel? movieListModel,
      List<Results>? results,
      List<Map<String, dynamic>> favoriteMovies,
      String searchQuery,
      Results? resultsData,
      String error});

  $MovieListModelCopyWith<$Res>? get movieListModel;
  $ResultsCopyWith<$Res>? get resultsData;
}

/// @nodoc
class _$MovieInfoStateCopyWithImpl<$Res, $Val extends MovieInfoState>
    implements $MovieInfoStateCopyWith<$Res> {
  _$MovieInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieInfoStatus = freezed,
    Object? isDarkMode = freezed,
    Object? movieListModel = freezed,
    Object? results = freezed,
    Object? favoriteMovies = null,
    Object? searchQuery = null,
    Object? resultsData = freezed,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      movieInfoStatus: freezed == movieInfoStatus
          ? _value.movieInfoStatus
          : movieInfoStatus // ignore: cast_nullable_to_non_nullable
              as MovieInfoStatus?,
      isDarkMode: freezed == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      movieListModel: freezed == movieListModel
          ? _value.movieListModel
          : movieListModel // ignore: cast_nullable_to_non_nullable
              as MovieListModel?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Results>?,
      favoriteMovies: null == favoriteMovies
          ? _value.favoriteMovies
          : favoriteMovies // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      resultsData: freezed == resultsData
          ? _value.resultsData
          : resultsData // ignore: cast_nullable_to_non_nullable
              as Results?,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of MovieInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovieListModelCopyWith<$Res>? get movieListModel {
    if (_value.movieListModel == null) {
      return null;
    }

    return $MovieListModelCopyWith<$Res>(_value.movieListModel!, (value) {
      return _then(_value.copyWith(movieListModel: value) as $Val);
    });
  }

  /// Create a copy of MovieInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultsCopyWith<$Res>? get resultsData {
    if (_value.resultsData == null) {
      return null;
    }

    return $ResultsCopyWith<$Res>(_value.resultsData!, (value) {
      return _then(_value.copyWith(resultsData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovieInfoStateImplCopyWith<$Res>
    implements $MovieInfoStateCopyWith<$Res> {
  factory _$$MovieInfoStateImplCopyWith(_$MovieInfoStateImpl value,
          $Res Function(_$MovieInfoStateImpl) then) =
      __$$MovieInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MovieInfoStatus? movieInfoStatus,
      bool? isDarkMode,
      MovieListModel? movieListModel,
      List<Results>? results,
      List<Map<String, dynamic>> favoriteMovies,
      String searchQuery,
      Results? resultsData,
      String error});

  @override
  $MovieListModelCopyWith<$Res>? get movieListModel;
  @override
  $ResultsCopyWith<$Res>? get resultsData;
}

/// @nodoc
class __$$MovieInfoStateImplCopyWithImpl<$Res>
    extends _$MovieInfoStateCopyWithImpl<$Res, _$MovieInfoStateImpl>
    implements _$$MovieInfoStateImplCopyWith<$Res> {
  __$$MovieInfoStateImplCopyWithImpl(
      _$MovieInfoStateImpl _value, $Res Function(_$MovieInfoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieInfoStatus = freezed,
    Object? isDarkMode = freezed,
    Object? movieListModel = freezed,
    Object? results = freezed,
    Object? favoriteMovies = null,
    Object? searchQuery = null,
    Object? resultsData = freezed,
    Object? error = null,
  }) {
    return _then(_$MovieInfoStateImpl(
      movieInfoStatus: freezed == movieInfoStatus
          ? _value.movieInfoStatus
          : movieInfoStatus // ignore: cast_nullable_to_non_nullable
              as MovieInfoStatus?,
      isDarkMode: freezed == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      movieListModel: freezed == movieListModel
          ? _value.movieListModel
          : movieListModel // ignore: cast_nullable_to_non_nullable
              as MovieListModel?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Results>?,
      favoriteMovies: null == favoriteMovies
          ? _value._favoriteMovies
          : favoriteMovies // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      resultsData: freezed == resultsData
          ? _value.resultsData
          : resultsData // ignore: cast_nullable_to_non_nullable
              as Results?,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MovieInfoStateImpl implements _MovieInfoState {
  const _$MovieInfoStateImpl(
      {this.movieInfoStatus = MovieInfoStatus.initial,
      this.isDarkMode = false,
      this.movieListModel,
      final List<Results>? results = const [],
      final List<Map<String, dynamic>> favoriteMovies = const [],
      this.searchQuery = "",
      this.resultsData,
      this.error = ""})
      : _results = results,
        _favoriteMovies = favoriteMovies;

  @override
  @JsonKey()
  final MovieInfoStatus? movieInfoStatus;
  @override
  @JsonKey()
  final bool? isDarkMode;
  @override
  final MovieListModel? movieListModel;
  final List<Results>? _results;
  @override
  @JsonKey()
  List<Results>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Map<String, dynamic>> _favoriteMovies;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get favoriteMovies {
    if (_favoriteMovies is EqualUnmodifiableListView) return _favoriteMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteMovies);
  }

  @override
  @JsonKey()
  final String searchQuery;
  @override
  final Results? resultsData;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'MovieInfoState(movieInfoStatus: $movieInfoStatus, isDarkMode: $isDarkMode, movieListModel: $movieListModel, results: $results, favoriteMovies: $favoriteMovies, searchQuery: $searchQuery, resultsData: $resultsData, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieInfoStateImpl &&
            (identical(other.movieInfoStatus, movieInfoStatus) ||
                other.movieInfoStatus == movieInfoStatus) &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.movieListModel, movieListModel) ||
                other.movieListModel == movieListModel) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            const DeepCollectionEquality()
                .equals(other._favoriteMovies, _favoriteMovies) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.resultsData, resultsData) ||
                other.resultsData == resultsData) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      movieInfoStatus,
      isDarkMode,
      movieListModel,
      const DeepCollectionEquality().hash(_results),
      const DeepCollectionEquality().hash(_favoriteMovies),
      searchQuery,
      resultsData,
      error);

  /// Create a copy of MovieInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieInfoStateImplCopyWith<_$MovieInfoStateImpl> get copyWith =>
      __$$MovieInfoStateImplCopyWithImpl<_$MovieInfoStateImpl>(
          this, _$identity);
}

abstract class _MovieInfoState implements MovieInfoState {
  const factory _MovieInfoState(
      {final MovieInfoStatus? movieInfoStatus,
      final bool? isDarkMode,
      final MovieListModel? movieListModel,
      final List<Results>? results,
      final List<Map<String, dynamic>> favoriteMovies,
      final String searchQuery,
      final Results? resultsData,
      final String error}) = _$MovieInfoStateImpl;

  @override
  MovieInfoStatus? get movieInfoStatus;
  @override
  bool? get isDarkMode;
  @override
  MovieListModel? get movieListModel;
  @override
  List<Results>? get results;
  @override
  List<Map<String, dynamic>> get favoriteMovies;
  @override
  String get searchQuery;
  @override
  Results? get resultsData;
  @override
  String get error;

  /// Create a copy of MovieInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieInfoStateImplCopyWith<_$MovieInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
