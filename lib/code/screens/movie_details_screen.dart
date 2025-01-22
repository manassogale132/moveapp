import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:move_app/code/widgets/custom_button.dart';

class MovieDetailScreen extends StatefulWidget {
  final Map<String, dynamic> movie;

  const MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late ConfettiController _confettiController;

  final List<Map<String, String>> dummyCast = [
    {
      'name': 'Robert Downey Jr.',
      'image':
          'https://ntvb.tmsimg.com/assets/assets/67369_v9_bd.jpg?w=360&h=480',
    },
    {
      'name': 'Chris Evans',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/ChrisEvans2023.jpg/1200px-ChrisEvans2023.jpg',
    },
    {
      'name': 'Scarlett Johansson',
      'image':
          'https://m.media-amazon.com/images/M/MV5BMTM3OTUwMDYwNl5BMl5BanBnXkFtZTcwNTUyNzc3Nw@@._V1_.jpg',
    },
    {
      'name': 'Chris Hemsworth',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Chris_Hemsworth_by_Gage_Skidmore_3.jpg/1200px-Chris_Hemsworth_by_Gage_Skidmore_3.jpg',
    },
    {
      'name': 'Mark Ruffalo',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Mark_Ruffalo_%2836201774756%29_%28cropped%29.jpg/640px-Mark_Ruffalo_%2836201774756%29_%28cropped%29.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final subtitleColor = isDarkMode ? Colors.white70 : Colors.black87;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Hero(
              tag: 'movie-image-${widget.movie['title']}',
              child: Image.network(
                widget.movie['image'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    isDarkMode ? Colors.black : Colors.white.withOpacity(0.95),
                    isDarkMode
                        ? Colors.black.withOpacity(0.8)
                        : Colors.white.withOpacity(0.7),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.0, 0.5, 0.9],
                ),
              ),
            ),
          ),
          // Confetti Widget
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              maxBlastForce: 5,
              minBlastForce: 2,
              emissionFrequency: 0.05,
              numberOfParticles: 50,
              gravity: 0.1,
            ),
          ),
          // Back Button and Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 16.0),
                  child: CircleAvatar(
                    backgroundColor: (isDarkMode ? Colors.black : Colors.white),
                    child: Icon(Icons.arrow_back, color: textColor),
                  ),
                ),
              ),
              const Spacer(),
              // Movie Details
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MOVIE',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.movie['title'],
                      style: TextStyle(
                        color: textColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "Rating",
                          style: TextStyle(
                            color: subtitleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 8),
                        InfoChip(
                          label: '${widget.movie['rating']}',
                          isDarkMode: isDarkMode,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.movie['description'],
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Dummy Cast',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dummyCast.length,
                        itemBuilder: (context, index) {
                          final cast = dummyCast[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              right: 16.0,
                              left: index == 0 ? 0 : 0,
                            ),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    cast['image']!,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    cast['name']!,
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: 'Watch now',
                      onPressed: () {
                        _confettiController.play();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoChip extends StatelessWidget {
  final String label;
  final bool isDarkMode;

  const InfoChip({
    required this.label,
    required this.isDarkMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: (isDarkMode ? Colors.red : Colors.white),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
