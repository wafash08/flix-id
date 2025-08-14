import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/usecases/login.dart";
import "../repositories/authentication_provider.dart";
import "../repositories/user_repository_provider.dart";

part "login_provider.g.dart";

@riverpod
Login login(Ref ref) => Login(
  authentication: ref.watch(authenticationProvider),
  userRepository: ref.watch(userRepositoryProvider),
);
