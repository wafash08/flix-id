import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../data/repositories/movie_repository.dart";
import "../../../data/tmdb/tmdb_movie_repository.dart";

part "movie_repository_provider.g.dart";

@riverpod
MovieRepository movieRepository(Ref ref) => TmdbMovieRepository();
