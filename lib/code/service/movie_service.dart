import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:move_app/code/models/movie_list_model.dart';

const apiKey = "eaca96bdff0d5502a2f7186f34b2a616";

final dio = Dio();

class MovieService {
  final popularMovies =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";

  Future<MovieListModel> getPopularMovies() async {
    try {
      if (kDebugMode) {
        print('📱 Making API request to: $popularMovies');
      }

      final response = await dio.get(
        popularMovies,
      );

      if (kDebugMode) {
        print('📱 Response status code: ${response.statusCode}');
        print('📱 Response data: ${response.data}');
      }

      if (response.statusCode == 200) {
        return MovieListModel.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load popular movies: Status ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('📱 Error in getPopularMovies: $e');
      }
      rethrow;
    }
  }
}
