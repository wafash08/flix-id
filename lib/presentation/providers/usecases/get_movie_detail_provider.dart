import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/usecases/get_movie_detail.dart";
import "../repositories/movie_repository_provider.dart";

part "get_movie_detail_provider.g.dart";

@riverpod
GetMovieDetail getMovieDetail(Ref ref) =>
    GetMovieDetail(movieRepository: ref.watch(movieRepositoryProvider));
