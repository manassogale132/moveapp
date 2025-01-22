import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/code/bloc/movie_info_bloc.dart';

class MovieListItem extends StatelessWidget {
  final Map<String, dynamic> movie;

  const MovieListItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'movie-image-${movie['title']}',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: movie['image'],
                height: 120,
                width: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Movie',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  movie['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  movie['genre'],
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ...List.generate(5, (starIndex) {
                      return Icon(
                        starIndex < movie['rating']
                            ? Icons.star
                            : starIndex < movie['rating'] + 0.5
                                ? Icons.star_half
                                : Icons.star_border,
                        color: Colors.amber,
                        size: 18,
                      );
                    }),
                    const Spacer(),
                    BlocBuilder<MovieInfoBloc, MovieInfoState>(
                      builder: (context, state) {
                        final isFavorite = state.favoriteMovies
                            .any((m) => m['title'] == movie['title']);
                        return IconButton(
                          onPressed: () {
                            context.read<MovieInfoBloc>().add(
                                  ToggleFavoriteEvent(movie: movie),
                                );
                          },
                          icon: Icon(
                            isFavorite
                                ? Icons.thumb_up
                                : Icons.thumb_up_outlined,
                            size: 20,
                            color: isFavorite ? Colors.blue : null,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
