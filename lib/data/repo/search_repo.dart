import 'package:cineverse/data/datasource/remote/search_api.dart';
import 'package:injectable/injectable.dart';

import '../models/account/movie_list_resp.dart';
import '../models/genre/genre_resp_model.dart';

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
}
