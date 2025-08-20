import "../../data/repositories/movie_repository.dart";
import "../entities/movie.dart";
import "../entities/result.dart";
import "usecase.dart";

enum MovieCategory { nowPlaying, upcoming }

class GetMovieListParams {
  GetMovieListParams({required this.category, required this.page});

  final MovieCategory category;
  final int page;
}

class GetMovieList implements UseCase<Result<List<Movie>>, GetMovieListParams> {
  GetMovieList({required MovieRepository movieRepository})
    : _movieRepository = movieRepository;

  final MovieRepository _movieRepository;

  @override
  Future<Result<List<Movie>>> execute(GetMovieListParams params) async {
    final moviesResult = switch (params.category) {
      MovieCategory.nowPlaying => await _movieRepository.getNowPlaying(
        page: params.page,
      ),
      MovieCategory.upcoming => await _movieRepository.getUpcoming(
        page: params.page,
      ),
    };

    return switch (moviesResult) {
      Success(val: final value) => Result.ok(value),
      Failure(:final err) => Result.error(err),
    };
  }
}
