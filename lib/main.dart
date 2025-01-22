import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/code/bloc/movie_info_bloc.dart';
import 'package:move_app/code/screens/movie_list_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  static const String _darkModeKey = 'isDarkMode';

  @override
  void initState() {
    super.initState();
    _loadDarkModePreference();
  }

  Future<void> _loadDarkModePreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool(_darkModeKey) ?? false;
    });
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = !_isDarkMode;
      prefs.setBool(_darkModeKey, _isDarkMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieInfoBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: _isDarkMode ? Brightness.dark : Brightness.light,
          ),
          useMaterial3: true,
        ),
        home: MovieListScreen(
          isDarkMode: _isDarkMode,
          onThemeToggle: toggleTheme,
        ),
      ),
    );
  }
}
