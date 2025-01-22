import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/code/bloc/movie_info_bloc.dart';
import 'package:move_app/code/models/movie_list_model.dart';
import 'package:move_app/code/widgets/movie_list_item.dart';

import 'package:move_app/code/screens/movie_details_screen.dart';

class MovieListScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const MovieListScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<dynamic> _getFilteredMovies(List<dynamic> movies, String query) {
    if (query.isEmpty) return movies;
    return movies.where((movie) {
      final title = movie is Results ? movie.title : movie['title'];
      return title.toString().toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _initMovies();
  }

  void _initMovies() {
    context.read<MovieInfoBloc>().add(const FetchMovieInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocListener<MovieInfoBloc, MovieInfoState>(
        listener: (context, state) {},
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text(
              'Movies',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                color: Colors.white,
                icon: Icon(
                    widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
                onPressed: widget.onThemeToggle,
              ),
            ],
          ),
          body: BlocBuilder<MovieInfoBloc, MovieInfoState>(
            builder: (context, state) {
              if (state.movieInfoStatus == MovieInfoStatus.submitting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.movieInfoStatus == MovieInfoStatus.error) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Something went wrong!!!",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _initMovies,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              final movies = state.movieListModel?.results ?? [];

              if (movies.isEmpty) {
                return const Center(
                  child: Text('No movies available'),
                );
              }

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search movies...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                      onChanged: (value) {
                        context.read<MovieInfoBloc>().add(
                              SearchMoviesEvent(query: value),
                            );
                      },
                    ),
                  ),
                  TabBar(
                    tabs: const [
                      Tab(text: 'All Movies'),
                      Tab(text: 'Favorites'),
                    ],
                    labelColor: Theme.of(context).colorScheme.primary,
                    unselectedLabelColor: Colors.grey,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // All Movies Tab
                        ListView.builder(
                          itemCount:
                              _getFilteredMovies(movies, state.searchQuery)
                                  .length,
                          itemBuilder: (context, index) {
                            final movie = _getFilteredMovies(
                                movies, state.searchQuery)[index];
                            return Card(
                              elevation: 0,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieDetailScreen(
                                        movie: {
                                          'title': movie.title,
                                          'genre': 'Movie',
                                          'rating': movie.voteAverage,
                                          'description': movie.overview,
                                          'image':
                                              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                        },
                                      ),
                                    ),
                                  );
                                },
                                child: MovieListItem(
                                  movie: {
                                    'title': movie.title,
                                    'genre': movie.releaseDate,
                                    'rating': movie.voteAverage,
                                    'description': movie.overview,
                                    'image':
                                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        // Favorites Tab
                        ListView.builder(
                          itemCount: _getFilteredMovies(
                                  state.favoriteMovies, state.searchQuery)
                              .length,
                          itemBuilder: (context, index) {
                            final movie = _getFilteredMovies(
                                state.favoriteMovies, state.searchQuery)[index];
                            return Card(
                              elevation: 0,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieDetailScreen(
                                        movie: movie,
                                      ),
                                    ),
                                  );
                                },
                                child: MovieListItem(
                                  movie: movie,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
