import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/usecases/top_up.dart";
import "../repositories/transaction_repository_provider.dart";

part "top_up_provider.g.dart";

@riverpod
TopUp topUP(Ref ref) =>
    TopUp(transactionRepository: ref.watch(transactionRepositoryProvider));
