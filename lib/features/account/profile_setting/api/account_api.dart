import 'package:cineverse/data/models/response_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:cineverse/core/api/api_constants.dart';
import 'package:cineverse/features/account/profile_setting/model/account_details_model.dart';

import '../../../../data/models/account/movie_list_resp.dart';

part 'account_api.g.dart';

@injectable
@RestApi()
abstract class AccountAPI {
  @factoryMethod
  factory AccountAPI(Dio dio) = _AccountAPI;

  @GET(ApiConstants.accountDetails)
  Future<AccountDetailsModel> getAccountDetails();

  @GET(ApiConstants.accountWatchlist)
  Future<MovieListResponse> getWatchlistMovies({
    @Query("language") String? language,
    @Query("sort_by") String sortBy = "created_at.asc",
    @Query("page") int page = 1,
  });

  @POST(ApiConstants.accountAddWatchlist)
  Future<ResponseModel> addToWatchlist({
    @Body() required Map<String, dynamic> watchlistRequest,
  });

  @GET(ApiConstants.accountFavorites)
  Future<MovieListResponse> getFavoriteMovies({
    @Query("language") String? language,
    @Query("sort_by") String sortBy = "created_at.asc",
    @Query("page") int page = 1,
  });

  @POST(ApiConstants.accountMarkFavorite)
  Future<ResponseModel> markAsFavorite({
    @Body() required Map<String, dynamic> favoriteRequest,
  });
}
