import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/usecases/logout.dart";
import "../repositories/authentication_provider.dart";

part "logout_provider.g.dart";

@riverpod
Logout logout(Ref ref) =>
    Logout(authentication: ref.watch(authenticationProvider));
