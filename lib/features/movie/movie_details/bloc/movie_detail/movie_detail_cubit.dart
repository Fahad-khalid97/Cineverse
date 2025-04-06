import 'package:cineverse/data/models/media/movie_detail_model.dart';
import 'package:cineverse/data/repo/media_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_detail_state.dart';
import 'package:cineverse/di/di.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit()
    : super(
        MovieDetailInitial(
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
        MovieDetailLoading(
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
        MovieDetailLoaded(
          movie: movie,
          reviews: reviews.results,
          rating: rating,
          cast: castAndCrew.cast,
          crew: castAndCrew.crew,
          authorDetails: authorDetails,
        ),
      );
    } catch (e) {
      emit(
        MovieDetailError(
          movie: MovieDetailsModel(),
          reviews: [],
          authorDetails: [],
          cast: [],
          crew: [],
          rating: state.rating,
          error: e.toString(),
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
