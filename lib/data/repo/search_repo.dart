import 'package:cineverse/features/movie/home/api/search_api.dart';
import 'package:injectable/injectable.dart';

import '../models/account/movie_list_resp.dart';
import '../../features/movie/home/model/genre_resp_model.dart';

@lazySingleton
class SearchRepo {
  final SearchAPI _searchAPI;

  SearchRepo(this._searchAPI);

  Future<MovieListResponse> searchMovies({
    String? language,
    required String query,
    int page = 1,
    bool? includeAdult,
    int? year,
  }) async {
    return await _searchAPI.searchMovies(
      language: language,
      query: query,
      page: page,
      includeAdult: includeAdult,
      year: year,
    );
  }

  Future<MovieListResponse> discoverMovies({
    String? language,
    String sortBy = "popularity.desc",
    bool? includeAdult,
    bool? includeVideo,
    int page = 1,
    String? withGenres,
    int? year,
  }) async {
    return await _searchAPI.discoverMovies(
      language: language,
      sortBy: sortBy,
      includeAdult: includeAdult,
      includeVideo: includeVideo,
      page: page,
      withGenres: withGenres,
      year: year,
    );
  }

  Future<GenreListResponse> getMovieGenres({String? language}) async {
    return await _searchAPI.getMovieGenres(language: language);
  }

  Future<MovieListResponse> discoverTvShows({
    String? language,
    String sortBy = "popularity.desc",
    bool? includeAdult,
    bool? includeVideo,
    String? withGenres,
    int page = 1,
  }) async {
    return await _searchAPI.discoverTv(
      language: language,
      sortBy: sortBy,
      includeAdult: includeAdult,
      includeVideo: includeVideo,
      page: page,
      withGenres: withGenres,
    );
  }

  Future<GenreListResponse> getTvGenres({String? language}) async {
    return await _searchAPI.getTvGenres(language: language);
  }

  Future<MovieListResponse> searchTvShows({
    String? language,
    required String query,
    int page = 1,
  }) async {
    return await _searchAPI.searchTv(
      language: language,
      query: query,
      page: page,
    );
  }
}
