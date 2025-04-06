import 'package:cineverse/data/models/media/movie_credit_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:cineverse/core/api/api_constants.dart';

import '../../models/account/movie_list_resp.dart';
import '../../models/media/movie_detail_model.dart';
import '../../models/media/movie_review_model.dart';

part 'media_api.g.dart';

@injectable
@RestApi()
abstract class MediaAPI {
  @factoryMethod
  factory MediaAPI(Dio dio) = _MediaAPI;

  // Home Screen
  @GET(ApiConstants.moviePopular)
  Future<MovieListResponse> getPopularMovies({
    @Query("language") String? language,
    @Query("page") int page = 1,
  });

  @GET(ApiConstants.movieTopRated)
  Future<MovieListResponse> getTopRatedMovies({
    @Query("language") String? language,
    @Query("page") int page = 1,
  });

  @GET(ApiConstants.movieUpcoming)
  Future<MovieListResponse> getUpcomingMovies({
    @Query("language") String? language,
    @Query("page") int page = 1,
  });

  @GET(ApiConstants.movieNowPlaying)
  Future<MovieListResponse> getNowPlayingMovies({
    @Query("language") String? language,
    @Query("page") int page = 1,
  });

  @GET(ApiConstants.movieDetails)
  Future<MovieDetailsModel> getMovieDetails({
    @Path("movie_id") required int movieId,
    @Query("language") String? language,
  });

  @GET(ApiConstants.movieReviews)
  Future<MovieReviewsResponse> getMovieReviews({
    @Path("movie_id") required int movieId,
  });

  @GET(ApiConstants.movieCredits)
  Future<MovieCreditsModel> getMovieCredits({
    @Path("movie_id") required int movieId,
  });

  //////// TV Shows /////////
  @GET(ApiConstants.tvPopular)
  Future<MovieListResponse> getPopularTv({
    @Query("language") String? language,
    @Query("page") int page = 1,
  });

  @GET(ApiConstants.tvTopRated)
  Future<MovieListResponse> getTopRatedTv({
    @Query("language") String? language,
    @Query("page") int page = 1,
  });

  @GET(ApiConstants.tvUpcoming)
  Future<MovieListResponse> getUpcomingTv({
    @Query("language") String? language,
    @Query("page") int page = 1,
  });

  @GET(ApiConstants.tvDetails)
  Future<MovieDetailsModel> getTvDetails({
    @Path("id") required int id,
    @Query("language") String? language,
  });

  @GET(ApiConstants.tvReviews)
  Future<MovieReviewsResponse> getTvReviews({@Path("id") required int id});

  @GET(ApiConstants.tvCredits)
  Future<MovieCreditsModel> getTvCredits({@Path("id") required int id});
}
