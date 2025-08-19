import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/entities/movie.dart";
import "../../../domain/entities/result.dart";
import "../../../domain/usecases/get_movie_list.dart";
import "../usecases/get_movie_list_provider.dart";

part "now_playing_provider.g.dart";

@Riverpod(keepAlive: true)
class NowPlaying extends _$NowPlaying {
  @override
  FutureOr<List<Movie>> build() {
    return const [];
  }

  Future<void> getMovies({int page = 1}) async {
    state = const AsyncLoading();

    final GetMovieList getMovieList = ref.read(getMovieListProvider);

    final result = await getMovieList.execute(
      GetMovieListParams(category: MovieCategory.nowPlaying, page: page),
    );

    switch (result) {
      case Success(val: final movies):
        state = AsyncData(movies);
      case Failure(err: _):
        state = const AsyncData([]);
    }
  }
}
