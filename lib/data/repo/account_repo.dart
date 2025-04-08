import 'package:cineverse/features/account/profile_setting/api/account_api.dart';
import 'package:injectable/injectable.dart';

import '../../features/account/profile_setting/model/account_details_model.dart';
import '../models/account/movie_list_resp.dart';
import '../models/response_model.dart';

@lazySingleton
class AccountRepo {
  final AccountAPI _accountAPI;

  AccountRepo(this._accountAPI);

  Future<AccountDetailsModel> getAccountDetails() async {
    return await _accountAPI.getAccountDetails();
  }

  Future<MovieListResponse> getWatchlistMovies({
    String? language,
    String sortBy = "created_at.asc",
    int page = 1,
  }) async {
    return await _accountAPI.getWatchlistMovies(
      language: language,
      sortBy: sortBy,
      page: page,
    );
  }

  Future<ResponseModel> addToWatchlist({
    required Map<String, dynamic> watchlistRequest,
  }) async {
    return await _accountAPI.addToWatchlist(watchlistRequest: watchlistRequest);
  }

  Future<MovieListResponse> getFavoriteMovies({
    String? language,
    String sortBy = "created_at.asc",
    int page = 1,
  }) async {
    return await _accountAPI.getFavoriteMovies(
      language: language,
      sortBy: sortBy,
      page: page,
    );
  }

  Future<ResponseModel> markAsFavorite({
    required Map<String, dynamic> favoriteRequest,
  }) async {
    return await _accountAPI.markAsFavorite(favoriteRequest: favoriteRequest);
  }
}
