import 'package:cineverse/data/datasource/remote/movies_api.dart';
import 'package:injectable/injectable.dart';

import '../models/account/movie_list_resp.dart';
import '../models/movies/movie_credit_model.dart';
import '../models/movies/movie_detail_model.dart';
import '../models/movies/movie_review_model.dart';
import '../models/movies/movie_videos_model.dart';
import '../models/response_model.dart';

@lazySingleton
class MoviesRepo {
  final MoviesAPI _moviesAPI;

  MoviesRepo(this._moviesAPI);

  Future<MovieListResponse> getPopularMovies({
    String language = "en-US",
    int page = 1,
  }) async {
    return await _moviesAPI.getPopularMovies(language: language, page: page);
  }

  Future<MovieListResponse> getTopRatedMovies({
    String language = "en-US",
    int page = 1,
  }) async {
    return await _moviesAPI.getTopRatedMovies(language: language, page: page);
  }

  Future<MovieListResponse> getNowPlayingMovies({
    String language = "en-US",
    int page = 1,
  }) async {
    return await _moviesAPI.getNowPlayingMovies(language: language, page: page);
  }

  Future<MovieListResponse> getUpcomingMovies({
    String language = "en-US",
    int page = 1,
  }) async {
    return await _moviesAPI.getUpcomingMovies(language: language, page: page);
  }

  Future<MovieDetailsModel> getMovieDetails({
    required int movieId,
    String language = "en-US",
  }) async {
    return await _moviesAPI.getMovieDetails(
      movieId: movieId,
      language: language,
    );
  }

  Future<MovieCreditsModel> getMovieCredits({
    required int movieId,
    String language = "en-US",
  }) async {
    return await _moviesAPI.getMovieCredits(
      movieId: movieId,
      language: language,
    );
  }

  Future<MovieVideosModel> getMovieVideos({
    required int movieId,
    String language = "en-US",
  }) async {
    return await _moviesAPI.getMovieVideos(
      movieId: movieId,
      language: language,
    );
  }

  Future<MovieListResponse> getSimilarMovies({
    required int movieId,
    String language = "en-US",
    int page = 1,
  }) async {
    return await _moviesAPI.getSimilarMovies(
      movieId: movieId,
      language: language,
      page: page,
    );
  }

  Future<MovieReviewsResponse> getMovieReviews({
    required int movieId,
    String language = "en-US",
    int page = 1,
  }) async {
    return await _moviesAPI.getMovieReviews(
      movieId: movieId,
      language: language,
      page: page,
    );
  }

  Future<MovieListResponse> getMovieRecommendations({
    required int movieId,
    String language = "en-US",
    int page = 1,
  }) async {
    return await _moviesAPI.getMovieRecommendations(
      movieId: movieId,
      language: language,
      page: page,
    );
  }

  Future<ResponseModel> rateMovie({
    required int movieId,
    required String sessionId,
    required Map<String, dynamic> ratingRequest,
  }) async {
    return await _moviesAPI.rateMovie(
      movieId: movieId,
      sessionId: sessionId,
      ratingRequest: ratingRequest,
    );
  }
}
