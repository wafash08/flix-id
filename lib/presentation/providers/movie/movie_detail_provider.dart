import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/entities/movie_detail.dart";
import "../../../domain/entities/result.dart";
import "../../../domain/usecases/get_movie_detail.dart";
import "../usecases/get_movie_detail_provider.dart";

part "movie_detail_provider.g.dart";

@riverpod
Future<MovieDetail?> movieDetail(Ref ref, {required int movieId}) async {
  final GetMovieDetail getMovieDetail = ref.read(getMovieDetailProvider);

  final movieDetailResult = await getMovieDetail.execute(
    GetMovieDetailParams(movieId: movieId),
  );

  return switch (movieDetailResult) {
    Success(val: final movieDetail) => movieDetail,
    Failure(err: _) => null,
  };
}
