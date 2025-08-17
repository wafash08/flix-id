import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/usecases/register.dart";
import "../repositories/authentication_provider.dart";
import "../repositories/user_repository_provider.dart";

part "register_provider.g.dart";

@riverpod
Register register(Ref ref) => Register(
  authentication: ref.watch(authenticationProvider),
  userRepository: ref.watch(userRepositoryProvider),
);
