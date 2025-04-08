import 'package:cineverse/data/models/media/movie_detail_model.dart';
import 'package:cineverse/data/repo/media_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'media_detail_state.dart';
import 'package:cineverse/di/di.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:cineverse/data/repo/account_repo.dart';
import 'package:flutter/foundation.dart';

@injectable
class MediaDetailCubit extends Cubit<MediaDetailState> {
  MediaDetailCubit()
    : super(
        MediaDetailInitial(
          movie: MovieDetailsModel(),
          reviews: [],
          rating: 0,
          authorDetails: [],
          cast: [],
          crew: [],
        ),
      );

  void loadMovieDetail(int movieId) async {
    final movieRepo = getIt<MediaRepo>();

    try {
      emit(
        MediaDetailLoading(
          movie: state.movie,
          reviews: state.reviews,
          rating: state.rating,
          cast: state.cast,
          crew: state.crew,
          authorDetails: state.authorDetails,
        ),
      );
      var movie = await movieRepo.getMovieDetails(movieId: movieId);
      var castAndCrew = await movieRepo.getMovieCredits(movieId: movieId);
      var reviews = await movieRepo.getMovieReviews(movieId: movieId);
      var authorDetails =
          reviews.results.map((review) => review.authorDetails).toList();
      //use isolates to calculate the rating
      final ratings = authorDetails.map((e) => e.rating).toList();
      double rating = await getRatingInIsolate(ratings);
      emit(
        MediaDetailLoaded(
          movie: movie,
          reviews: reviews.results,
          rating: rating,
          cast: castAndCrew.cast,
          crew: castAndCrew.crew,
          authorDetails: authorDetails,
        ),
      );
    } on DioException catch (e) {
      emit(
        MediaDetailError(
          movie: MovieDetailsModel(),
          reviews: [],
          authorDetails: [],
          cast: [],
          crew: [],
          rating: state.rating,
          error: e.error.toString(),
        ),
      );
    }
  }

  void loadTvDetail(int tvId) async {
    final movieRepo = getIt<MediaRepo>();

    try {
      emit(
        MediaDetailLoading(
          movie: state.movie,
          reviews: state.reviews,
          rating: state.rating,
          cast: state.cast,
          crew: state.crew,
          authorDetails: state.authorDetails,
        ),
      );
      var movie = await movieRepo.getTvDetails(id: tvId);
      var castAndCrew = await movieRepo.getTvCredits(id: tvId);
      var reviews = await movieRepo.getTvReviews(id: tvId);
      var authorDetails =
          reviews.results.map((review) => review.authorDetails).toList();
      final ratings = authorDetails.map((e) => e.rating).toList();
      double rating = await getRatingInIsolate(ratings);
      emit(
        MediaDetailLoaded(
          movie: movie,
          reviews: reviews.results,
          rating: rating,
          cast: castAndCrew.cast,
          crew: castAndCrew.crew,
          authorDetails: authorDetails,
        ),
      );
    } on DioException catch (e) {
      emit(
        MediaDetailError(
          movie: MovieDetailsModel(),
          reviews: [],
          authorDetails: [],
          cast: [],
          crew: [],
          rating: state.rating,
          error: e.error.toString(),
        ),
      );
    }
  }

  void addToWatchlist(String type) async {
    final accountRepo = getIt<AccountRepo>();
    try {
      await accountRepo.addToWatchlist(
        watchlistRequest: {
          "media_type": type,
          "media_id": state.movie.id,
          "watchlist": true,
        },
      );
      emit(
        MediaDetailWatchlistAdded(
          movie: state.movie,
          reviews: state.reviews,
          authorDetails: state.authorDetails,
          cast: state.cast,
          crew: state.crew,
          rating: state.rating,
        ),
      );
    } catch (e) {
      emit(
        MediaDetailError(
          movie: state.movie,
          reviews: state.reviews,
          authorDetails: state.authorDetails,
          cast: state.cast,
          crew: state.crew,
          rating: state.rating,
          error: e.toString(),
        ),
      );
    }
  }

  void addToFavorites(String type) async {
    final accountRepo = getIt<AccountRepo>();
    try {
      await accountRepo.markAsFavorite(
        favoriteRequest: {
          "media_type": type,
          "media_id": state.movie.id,
          "favorite": true,
        },
      );
      emit(
        MediaDetailFavoritesAdded(
          movie: state.movie,
          reviews: state.reviews,
          authorDetails: state.authorDetails,
          cast: state.cast,
          crew: state.crew,
          rating: state.rating,
        ),
      );
    } catch (e) {
      emit(
        MediaDetailError(
          movie: state.movie,
          reviews: state.reviews,
          authorDetails: state.authorDetails,
          cast: state.cast,
          crew: state.crew,
          rating: state.rating,
          error: e.toString(),
        ),
      );
    }
  }
}

double calculateAverageRating(List<double?> ratings) {
  if (ratings.isEmpty) return 0;
  final total = ratings.fold(0.0, (sum, r) => sum + (r ?? 0.0));
  final average = (total / ratings.length) / 2;
  return double.parse(average.toStringAsFixed(1));
}

Future<double> getRatingInIsolate(List<double?> ratings) async {
  return await compute(calculateAverageRating, ratings);
}
