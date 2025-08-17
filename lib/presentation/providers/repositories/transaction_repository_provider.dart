import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../data/repositories/transaction_repository.dart";
import "../../../data/firebase/firebase_transaction_repository.dart";

part "transaction_repository_provider.g.dart";

@riverpod
TransactionRepository transactionRepository(Ref ref) =>
    FirebaseTransactionRepository();
