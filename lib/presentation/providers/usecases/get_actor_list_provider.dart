import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/usecases/get_actor_list.dart";
import "../repositories/movie_repository_provider.dart";

part "get_actor_list_provider.g.dart";

@riverpod
GetActorList getActorList(Ref ref) =>
    GetActorList(movieRepository: ref.watch(movieRepositoryProvider));
