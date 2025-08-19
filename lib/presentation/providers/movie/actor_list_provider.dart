import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/entities/actor.dart";
import "../../../domain/entities/result.dart";
import "../../../domain/usecases/get_actor_list.dart";
import "../usecases/get_actor_list_provider.dart";

part "actor_list_provider.g.dart";

@riverpod
Future<List<Actor>> actorList(Ref ref, {required int movieId}) async {
  final GetActorList getActorList = ref.read(getActorListProvider);

  final actorListResult = await getActorList.execute(
    GetActorListParams(movieId: movieId),
  );

  return switch (actorListResult) {
    Success(val: final actorList) => actorList,
    Failure(err: _) => const [],
  };
}
