class AppRoutes {
  static const String login = '/login';
  static const String myList = '/myList';
  static const String home = '/home';
  static const String movieDetails = '/movie-details';
  static const String profile = '/profile';

  // Paths with parameters
  static String movieDetailsPath(int movieId) => '$movieDetails?id=$movieId';
}
