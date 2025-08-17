import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/usecases/get_user_balance.dart";
import "../repositories/user_repository_provider.dart";

part "get_user_balance_provider.g.dart";

@riverpod
GetUserBalance getUserBalance(Ref ref) =>
    GetUserBalance(userRepository: ref.watch(userRepositoryProvider));
