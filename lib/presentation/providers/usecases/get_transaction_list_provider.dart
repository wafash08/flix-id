import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/usecases/get_transaction_list.dart";
import "../repositories/transaction_repository_provider.dart";

part "get_transaction_list_provider.g.dart";

@riverpod
GetTransactionList getTransactionList(Ref ref) => GetTransactionList(
  transactionRepository: ref.watch(transactionRepositoryProvider),
);
