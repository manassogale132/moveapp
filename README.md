# Move App Documentation



## Overview
A Flutter application that displays movie information, allows searching, and manages favorite movies. The app implements dark/light theme switching and uses TMDB API for movie data.



## Architecture
The app follows the BLoC (Business Logic Component) pattern for state management, with a clean separation of concerns:



### Directory Structure
```
lib/
├── code/
│   ├── bloc/         # State management
│   ├── models/       # Data models
│   ├── screens/      # UI screens
│   ├── service/      # API services
│   └── widgets/      # Reusable widgets
└── main.dart         # App entry point
```



## State Management
- Uses `flutter_bloc` (v9.0.0) for state management
- Main BLoC: `MovieInfoBloc`
- States:
  - `MovieInfoStatus`: initial, submitting, submitted, error
  - `MovieInfoState`: Handles movie list, favorites, search, and theme data
- Events:
  - `FetchMovieInfoEvent`: Fetches popular movies
  - `ToggleFavoriteEvent`: Manages favorite movies
  - `SearchMoviesEvent`: Handles movie search



## Key Features
1. Movie Listing
   - Displays popular movies from TMDB API
   - Implements infinite scrolling
   - Shows movie posters and basic information



2. Movie Details
   - Detailed view of selected movie
   - Cast information (dummy data)
   - Confetti animation on certain actions



3. Search Functionality
   - Real-time movie search
   - Filters both API results and favorites



4. Favorites Management
   - Add/remove movies to favorites
   - Persistent storage using SharedPreferences
   - Separate tab for favorite movies



5. Theme Management
   - Toggle between light/dark themes
   - Persistent theme preference



## Dependencies
```yaml
Major packages:
- flutter_bloc: ^9.0.0        # State management
- dio: ^5.7.0                 # HTTP client
- freezed: ^2.5.7            # Code generation for models
- shared_preferences          # Local storage
- confetti: ^0.8.0           # Visual effects
- cached_network_image       # Image caching
- json_serializable: ^6.9.0  # JSON serialization
```



## API Integration
- Uses TMDB API for movie data
- Base URL: https://api.themoviedb.org/3/
- Endpoints:
  - Popular movies: `/movie/popular`
- Service class: `MovieService` handles API calls



## Models
1. `MovieListModel`
   - Handles movie list response
   - Generated using freezed
   - Contains movie details like title, overview, ratings



2. `Results`
   - Individual movie data model
   - Contains detailed movie information



## Persistence
- Favorites stored using SharedPreferences
- Theme preference persisted across sessions
- Movie data cached for offline access



## Error Handling
- Comprehensive error states in BLoC
- User-friendly error messages
- Retry mechanism for failed API calls
