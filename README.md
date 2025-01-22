![Screenshot_20250122_144023_com_example_untitled_MainActivity](https://github.com/user-attachments/assets/b2aaf9bd-e1ea-4aaa-b23d-d964318fecc8)# Move App Documentation



![Screenshot_20250122_143942_com_example_untitled_MainActivity](https://github.com/user-attachments/assets/0dceb757-e7f7-42f8-99eb-e876ddc53109)
![Screenshot_20250122_143946_com_example_untitled_MainActivity](https://github.com/user-attachments/assets/dfaa714e-2a79-45c4-8efa-8b67a4d907c8)
![Screenshot_20250122_144018_com_example_untitled_MainActivity](https://github.com/user-attachments/assets/d17acefe-b1f6-42ea-bdfa-1d3dfd3d41b5)
![Screenshot_20250122_143957_com_example_untitled_MainActivity](https://github.com/user-attachments/assets/4526d4e6-c667-4a52-9883-493d2a62346c)
![Screenshot_20250122_144023_com_example_untitled_MainActivity](https://github.com/user-attachments/assets/d400cee1-73e0-4001-943d-3a924a9e517e)

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
