import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/usecases/get_logged_in_user.dart";
import "../repositories/authentication_provider.dart";
import "../repositories/user_repository_provider.dart";

part "get_logged_in_user_provider.g.dart";

@riverpod
GetLoggedInUser getLoggedInUser(Ref ref) => GetLoggedInUser(
  authentication: ref.watch(authenticationProvider),
  userRepository: ref.watch(userRepositoryProvider),
);
