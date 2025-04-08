import 'package:cineverse/data/models/media/movie_detail_model.dart';
import 'package:cineverse/data/repo/media_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'media_detail_state.dart';
import 'package:cineverse/di/di.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

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
      double rating =
          authorDetails.isEmpty
              ? 0
              : double.parse(
                ((authorDetails
                                .map((e) => e.rating ?? 0.0)
                                .reduce((a, b) => a + b) /
                            authorDetails.length) /
                        2)
                    .toStringAsFixed(1),
              );
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
      double rating =
          authorDetails.isEmpty
              ? 0
              : double.parse(
                ((authorDetails
                                .map((e) => e.rating ?? 0.0)
                                .reduce((a, b) => a + b) /
                            authorDetails.length) /
                        2)
                    .toStringAsFixed(1),
              );
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

  // void addToWatchlist(int movieId) async {
  //   final accountRepo = getIt<AccountRepo>();
  //   await accountRepo.addToWatchlist(movieId);
  // }

  // void removeFromWatchlist(int movieId) async {
  //   final mediaRepo = getIt<MediaRepo>();
  //   await mediaRepo.removeFromWatchlist(movieId);
  // }
}
