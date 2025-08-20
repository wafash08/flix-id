import "package:flutter/foundation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../domain/entities/result.dart";
import "../../domain/entities/transaction.dart";
import "../../domain/entities/user.dart";
import "../../domain/usecases/get_transaction_list.dart";
import "usecases/get_transaction_list_provider.dart";
import "user_data_provider.dart";

part "transaction_data_provider.g.dart";

@Riverpod(keepAlive: true)
class TransactionData extends _$TransactionData {
  @override
  Future<List<Transaction>> build() async {
    final User? user = ref.watch(userDataProvider).valueOrNull;

    if (user == null) return const [];

    state = const AsyncLoading();
    final result = await ref
        .read(getTransactionListProvider)
        .execute(GetTransactionListParams(uid: user.uid));

    return switch (result) {
      Success(val: final transactionList) => transactionList,
      Failure(err: _) => const [],
    };
  }

  Future<void> refreshTransactionData() async {
    final User? user = ref.watch(userDataProvider).valueOrNull;

    if (user == null) return;

    state = const AsyncLoading();
    final result = await ref
        .read(getTransactionListProvider)
        .execute(GetTransactionListParams(uid: user.uid));

    switch (result) {
      case Success(val: final transactionList):
        state = AsyncData(transactionList);
        break;
      case Failure(err: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = AsyncData(state.valueOrNull ?? const []);
        break;
    }
  }
}
