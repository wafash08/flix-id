import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/usecases/create_transaction.dart";
import "../repositories/transaction_repository_provider.dart";

part "create_transaction_provider.g.dart";

@riverpod
CreateTransaction createTransaction(Ref ref) => CreateTransaction(
  transactionRepository: ref.watch(transactionRepositoryProvider),
);
