import 'package:cineverse/data/datasource/remote/account_api.dart';
import 'package:injectable/injectable.dart';

import '../models/account/account_details_model.dart';
import '../models/account/movie_list_resp.dart';
import '../models/response_model.dart';

@lazySingleton
class AccountRepo {
  final AccountAPI _accountAPI;

  AccountRepo(this._accountAPI);

  Future<AccountDetailsModel> getAccountDetails(String sessionId) async {
    return await _accountAPI.getAccountDetails(sessionId: sessionId);
  }

  Future<MovieListResponse> getWatchlistMovies({
    required int accountId,
    required String sessionId,
    String? language,
    String sortBy = "created_at.asc",
    int page = 1,
  }) async {
    return await _accountAPI.getWatchlistMovies(
      accountId: accountId,
      sessionId: sessionId,
      language: language,
      sortBy: sortBy,
      page: page,
    );
  }

  Future<ResponseModel> addToWatchlist({
    required int accountId,
    required String sessionId,
    required Map<String, dynamic> watchlistRequest,
  }) async {
    return await _accountAPI.addToWatchlist(
      accountId: accountId,
      sessionId: sessionId,
      watchlistRequest: watchlistRequest,
    );
  }

  Future<MovieListResponse> getFavoriteMovies({
    required int accountId,
    required String sessionId,
    String? language,
    String sortBy = "created_at.asc",
    int page = 1,
  }) async {
    return await _accountAPI.getFavoriteMovies(
      accountId: accountId,
      sessionId: sessionId,
      language: language,
      sortBy: sortBy,
      page: page,
    );
  }

  Future<ResponseModel> markAsFavorite({
    required int accountId,
    required String sessionId,
    required Map<String, dynamic> favoriteRequest,
  }) async {
    return await _accountAPI.markAsFavorite(
      accountId: accountId,
      sessionId: sessionId,
      favoriteRequest: favoriteRequest,
    );
  }
}
