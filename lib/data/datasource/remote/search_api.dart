import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:cineverse/core/api/api_constants.dart';

import '../../models/account/movie_list_resp.dart';
import '../../models/genre/genre_resp_model.dart';

part 'search_api.g.dart';

@RestApi()
abstract class SearchAPI {
  factory SearchAPI(Dio dio, {String? baseUrl}) = _SearchAPI;

  @GET(ApiConstants.searchMovie)
  Future<MovieListResponse> searchMovies({
    @Query("language") String language = "en-US",
    @Query("query") required String query,
    @Query("page") int page = 1,
    @Query("include_adult") bool includeAdult = false,
    @Query("year") int? year,
  });

  @GET(ApiConstants.discoverMovie)
  Future<MovieListResponse> discoverMovies({
    @Query("language") String language = "en-US",
    @Query("sort_by") String sortBy = "popularity.desc",
    @Query("include_adult") bool includeAdult = false,
    @Query("include_video") bool includeVideo = false,
    @Query("page") int page = 1,
    @Query("with_genres") String? withGenres,
    @Query("year") int? year,
  });

  @GET(ApiConstants.genreList)
  Future<GenreListResponse> getMovieGenres({
    @Query("language") String language = "en-US",
  });
}
