import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:cineverse/core/api/api_constants.dart';

import '../../../../data/models/account/movie_list_resp.dart';
import '../model/genre_resp_model.dart';

part 'search_api.g.dart';

@injectable
@RestApi()
abstract class SearchAPI {
  @factoryMethod
  factory SearchAPI(Dio dio) = _SearchAPI;

  @GET(ApiConstants.searchMovie)
  Future<MovieListResponse> searchMovies({
    @Query("language") String? language,
    @Query("query") required String query,
    @Query("page") int page = 1,
    @Query("include_adult") bool? includeAdult,
    @Query("year") int? year,
  });

  @GET(ApiConstants.discoverMovie)
  Future<MovieListResponse> discoverMovies({
    @Query("language") String? language,
    @Query("sort_by") String? sortBy = "popularity.desc",
    @Query("include_adult") bool? includeAdult,
    @Query("include_video") bool? includeVideo,
    @Query("page") int page = 1,
    @Query("with_genres") String? withGenres,
    @Query("year") int? year,
  });

  @GET(ApiConstants.genreList)
  Future<GenreListResponse> getMovieGenres({
    @Query("language") String? language,
  });

  @GET(ApiConstants.searchTv)
  Future<MovieListResponse> searchTv({
    @Query("language") String? language,
    @Query("query") required String query,
    @Query("page") int page = 1,
  });

  @GET(ApiConstants.discoverTv)
  Future<MovieListResponse> discoverTv({
    @Query("language") String? language,
    @Query("sort_by") String? sortBy = "popularity.desc",
    @Query("include_adult") bool? includeAdult,
    @Query("include_video") bool? includeVideo,
    @Query("page") int page = 1,
    @Query("with_genres") String? withGenres,
    @Query("with_networks") String? withNetworks,
    @Query("first_air_date_year") int? firstAirDateYear,
  });

  @GET(ApiConstants.genreListTv)
  Future<GenreListResponse> getTvGenres({@Query("language") String? language});
}
