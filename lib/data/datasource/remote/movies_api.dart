import 'package:cineverse/data/models/response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:cineverse/core/api/api_constants.dart';

import '../../models/account/movie_list_resp.dart';
import '../../models/movies/movie_credit_model.dart';
import '../../models/movies/movie_detail_model.dart';
import '../../models/movies/movie_review_model.dart';
import '../../models/movies/movie_videos_model.dart';

part 'movies_api.g.dart';

@RestApi()
abstract class MoviesAPI {
  factory MoviesAPI(Dio dio, {String? baseUrl}) = _MoviesAPI;

  // Home Screen
  @GET(ApiConstants.moviePopular)
  Future<MovieListResponse> getPopularMovies({
    @Query("language") String language = "en-US",
    @Query("page") int page = 1,
  });

  @GET(ApiConstants.movieTopRated)
  Future<MovieListResponse> getTopRatedMovies({
    @Query("language") String language = "en-US",
    @Query("page") int page = 1,
  });

  @GET(ApiConstants.movieNowPlaying)
  Future<MovieListResponse> getNowPlayingMovies({
    @Query("language") String language = "en-US",
    @Query("page") int page = 1,
  });

  @GET(ApiConstants.movieUpcoming)
  Future<MovieListResponse> getUpcomingMovies({
    @Query("language") String language = "en-US",
    @Query("page") int page = 1,
  });

  // Movie Details
  @GET(ApiConstants.movieDetails)
  Future<MovieDetailsModel> getMovieDetails({
    @Path("movie_id") required int movieId,
    @Query("language") String language = "en-US",
  });

  @GET(ApiConstants.movieCredits)
  Future<MovieCreditsModel> getMovieCredits({
    @Path("movie_id") required int movieId,
    @Query("language") String language = "en-US",
  });

  @GET(ApiConstants.movieVideos)
  Future<MovieVideosModel> getMovieVideos({
    @Path("movie_id") required int movieId,
    @Query("language") String language = "en-US",
  });

  @GET(ApiConstants.movieSimilar)
  Future<MovieListResponse> getSimilarMovies({
    @Path("movie_id") required int movieId,
    @Query("language") String language = "en-US",
    @Query("page") int page = 1,
  });

  @GET(ApiConstants.movieReviews)
  Future<MovieReviewsResponse> getMovieReviews({
    @Path("movie_id") required int movieId,
    @Query("language") String language = "en-US",
    @Query("page") int page = 1,
  });

  @GET(ApiConstants.movieRecommendations)
  Future<MovieListResponse> getMovieRecommendations({
    @Path("movie_id") required int movieId,
    @Query("language") String language = "en-US",
    @Query("page") int page = 1,
  });

  @POST(ApiConstants.movieRating)
  Future<ResponseModel> rateMovie({
    @Path("movie_id") required int movieId,
    @Query("session_id") required String sessionId,
    @Body() required Map<String, dynamic> ratingRequest,
  });
}
