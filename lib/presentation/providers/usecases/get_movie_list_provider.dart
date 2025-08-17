import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/usecases/get_movie_list.dart";
import "../repositories/movie_repository_provider.dart";

part "get_movie_list_provider.g.dart";

@riverpod
GetMovieList getMovieList(Ref ref) =>
    GetMovieList(movieRepository: ref.watch(movieRepositoryProvider));
