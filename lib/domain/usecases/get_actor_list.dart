import "../../data/repositories/movie_repository.dart";
import "../entities/actor.dart";
import "../entities/result.dart";
import "usecase.dart";

class GetActorListParams {
  GetActorListParams({required this.movieId});

  final int movieId;
}

class GetActorList implements UseCase<Result<List<Actor>>, GetActorListParams> {
  GetActorList({required MovieRepository movieRepository})
    : _movieRepository = movieRepository;

  final MovieRepository _movieRepository;

  @override
  Future<Result<List<Actor>>> execute(GetActorListParams params) async {
    final movieDetailResult = await _movieRepository.getActorList(
      id: params.movieId,
    );

    return switch (movieDetailResult) {
      Success(val: final value) => Result.ok(value),
      Failure(:final err) => Result.error(err),
    };
  }
}
