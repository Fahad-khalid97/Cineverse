import 'package:cineverse/data/datasource/remote/media_api.dart';
import 'package:injectable/injectable.dart';
import '../models/account/movie_list_resp.dart';
import '../models/media/movie_detail_model.dart';
import '../models/media/movie_review_model.dart';
import '../models/media/movie_credit_model.dart';

@lazySingleton
class MediaRepo {
  final MediaAPI _mediaAPI;

  MediaRepo(this._mediaAPI);

  Future<MovieListResponse> getPopularMovies({
    String? language,
    int page = 1,
  }) async {
    return await _mediaAPI.getPopularMovies(language: language, page: page);
  }

  Future<MovieListResponse> getTopRatedMovies({
    String? language,
    int page = 1,
  }) async {
    return await _mediaAPI.getTopRatedMovies(language: language, page: page);
  }

  Future<MovieListResponse> getUpcomingMovies({
    String? language,
    int page = 1,
  }) async {
    return await _mediaAPI.getUpcomingMovies(language: language, page: page);
  }

  Future<MovieListResponse> getNowPlayingMovies({
    String? language,
    int page = 1,
  }) async {
    return await _mediaAPI.getNowPlayingMovies(language: language, page: page);
  }

  Future<MovieDetailsModel> getMovieDetails({
    required int movieId,
    String? language,
  }) async {
    return await _mediaAPI.getMovieDetails(
      movieId: movieId,
      language: language,
    );
  }

  Future<MovieReviewsResponse> getMovieReviews({required int movieId}) async {
    return await _mediaAPI.getMovieReviews(movieId: movieId);
  }

  /// TV Shows ///
  Future<MovieListResponse> getPopularTv({
    String? language,
    int page = 1,
  }) async {
    return await _mediaAPI.getPopularTv(language: language, page: page);
  }

  Future<MovieListResponse> getTopRatedTv({
    String? language,
    int page = 1,
  }) async {
    return await _mediaAPI.getTopRatedTv(language: language, page: page);
  }

  Future<MovieListResponse> getUpcomingTv({
    String? language,
    int page = 1,
  }) async {
    return await _mediaAPI.getUpcomingTv(language: language, page: page);
  }

  Future<MovieDetailsModel> getTvDetails({
    required int id,
    String? language,
  }) async {
    return await _mediaAPI.getTvDetails(id: id, language: language);
  }

  Future<MovieReviewsResponse> getTvReviews({required int id}) async {
    return await _mediaAPI.getTvReviews(id: id);
  }

  Future<MovieCreditsModel> getMovieCredits({required int movieId}) async {
    return await _mediaAPI.getMovieCredits(movieId: movieId);
  }

  Future<MovieCreditsModel> getTvCredits({required int id}) async {
    return await _mediaAPI.getTvCredits(id: id);
  }
}
