import 'package:cineverse/data/models/response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:cineverse/core/api/api_constants.dart';
import 'package:cineverse/data/models/account/account_details_model.dart';

import '../../models/account/movie_list_resp.dart';

part 'account_api.g.dart';

@injectable
@RestApi()
abstract class AccountAPI {
  @factoryMethod
  factory AccountAPI(Dio dio) = _AccountAPI;

  @GET(ApiConstants.accountDetails)
  Future<AccountDetailsModel> getAccountDetails({
    @Query("session_id") required String sessionId,
  });

  @GET(ApiConstants.accountWatchlist)
  Future<MovieListResponse> getWatchlistMovies({
    @Path("account_id") required int accountId,
    @Query("session_id") required String sessionId,
    @Query("language") String? language,
    @Query("sort_by") String sortBy = "created_at.asc",
    @Query("page") int page = 1,
  });

  @POST(ApiConstants.accountAddWatchlist)
  Future<ResponseModel> addToWatchlist({
    @Path("account_id") required int accountId,
    @Query("session_id") required String sessionId,
    @Body() required Map<String, dynamic> watchlistRequest,
  });

  @GET(ApiConstants.accountFavorites)
  Future<MovieListResponse> getFavoriteMovies({
    @Path("account_id") required int accountId,
    @Query("session_id") required String sessionId,
    @Query("language") String? language,
    @Query("sort_by") String sortBy = "created_at.asc",
    @Query("page") int page = 1,
  });

  @POST(ApiConstants.accountMarkFavorite)
  Future<ResponseModel> markAsFavorite({
    @Path("account_id") required int accountId,
    @Query("session_id") required String sessionId,
    @Body() required Map<String, dynamic> favoriteRequest,
  });
}
