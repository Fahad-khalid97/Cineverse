import 'package:cineverse/core/config/env_config.dart';

class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';

  // Use environment variables instead of hardcoded values
  static String get apiKey => EnvConfig.apiKey;
  static String get bearerToken => EnvConfig.bearerToken;

  static int get timeOut => 30;

  // Image URLs
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/';
  static const String smallImageSize = 'w200';
  static const String mediumImageSize = 'w400';
  static const String largeImageSize = 'w780';
  static const String originalImageSize = 'original';

  // Endpoints
  static const String authTokenNew = '/authentication/token/new';
  static const String authValidateWithLogin =
      '/authentication/token/validate_with_login';
  static const String authCreateSession = '/authentication/session/new';
  static const String authDeleteSession = '/authentication/session';

  static const String accountDetails = '/account';
  static const String accountWatchlist =
      '/account/{account_id}/watchlist/movies';
  static const String accountAddWatchlist = '/account/{account_id}/watchlist';
  static const String accountFavorites =
      '/account/{account_id}/favorite/movies';
  static const String accountMarkFavorite = '/account/{account_id}/favorite';

  // Movie
  static const String moviePopular = '/movie/popular';
  static const String movieTopRated = '/movie/top_rated';
  static const String movieUpcoming = '/movie/upcoming';
  static const String movieDetails = '/movie/{movie_id}';
  static const String movieNowPlaying = '/movie/now_playing';
  static const String movieCredits = '/movie/{movie_id}/credits';
  static const String movieReviews = '/movie/{movie_id}/reviews';

  static const String searchMovie = '/search/movie';
  static const String discoverMovie = '/discover/movie';
  static const String genreList = '/genre/movie/list';

  // TV Shows
  static const String tvPopular = '/tv/popular';
  static const String tvTopRated = '/tv/top_rated';
  static const String tvUpcoming = '/tv/upcoming';
  static const String tvDetails = '/tv/{id}';
  static const String tvReviews = '/tv/{id}/reviews';
  static const String tvCredits = '/tv/{id}/credits';

  static const String searchTv = '/search/tv';
  static const String discoverTv = '/discover/tv';
  static const String genreListTv = '/genre/tv/list';

  static const String configuration = '/configuration';
  static const String configurationLanguages = '/configuration/languages';
  static const String configurationCountries = '/configuration/countries';
  static const String configurationTimezones = '/configuration/timezones';
}
