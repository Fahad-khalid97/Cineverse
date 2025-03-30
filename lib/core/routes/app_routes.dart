class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String search = '/search';
  static const String home = '/home';
  static const String movieDetails = '/movie-details';
  static const String profile = '/profile';

  // Paths with parameters
  static String movieDetailsPath(int movieId) => '$movieDetails?id=$movieId';
}
