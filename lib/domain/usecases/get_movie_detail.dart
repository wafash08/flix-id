import "../../data/repositories/movie_repository.dart";
import "../entities/movie_detail.dart";
import "../entities/result.dart";
import "usecase.dart";

class GetMovieDetailParams {
  GetMovieDetailParams({required this.movieId});

  final int movieId;
}

class GetMovieDetail
    implements UseCase<Result<MovieDetail>, GetMovieDetailParams> {
  final MovieRepository _movieRepository;

  GetMovieDetail({required MovieRepository movieRepository})
    : _movieRepository = movieRepository;

  @override
  Future<Result<MovieDetail>> execute(GetMovieDetailParams params) async {
    final movieDetailResult = await _movieRepository.getDetail(
      id: params.movieId,
    );

    return switch (movieDetailResult) {
      Success(val: final value) => Result.ok(value),
      Failure(:final err) => Result.error(err),
    };
  }
}
