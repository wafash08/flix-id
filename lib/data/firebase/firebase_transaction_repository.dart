import "package:cloud_firestore/cloud_firestore.dart" as firestore;

import "../../domain/entities/result.dart";
import "../../domain/entities/transaction.dart";
import "../repositories/transaction_repository.dart";
import "firebase_user_repository.dart";

class FirebaseTransactionRepository implements TransactionRepository {
  FirebaseTransactionRepository({
    firestore.FirebaseFirestore? firebaseFirestore,
  }) : _firestore = firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  final firestore.FirebaseFirestore _firestore;

  @override
  Future<Result<Transaction>> createTransaction({
    required Transaction transaction,
  }) async {
    final firestore.CollectionReference<Map<String, dynamic>> transactions =
        _firestore.collection("transactions");

    try {
      final Result<int> balanceResult = await FirebaseUserRepository()
          .getUserBalance(uid: transaction.uid);

      if (balanceResult.isSuccess) {
        final int currentBalance = balanceResult.value!;

        if (currentBalance - transaction.total >= 0) {
          await transactions.doc(transaction.id).set(transaction.toJson());

          final result = await transactions.doc(transaction.id).get();
          if (result.exists) {
            await FirebaseUserRepository().updateUserBalance(
              uid: transaction.uid,
              balance: currentBalance - transaction.total,
            );

            return Result.ok(Transaction.fromJson(result.data()!));
          } else {
            return Result.error("Failed to create transaction data");
          }
        } else {
          return Result.error("Insufficient balance");
        }
      } else {
        return Result.error("Failed to create transaction data");
      }
    } catch (e) {
      return Result.error("Failed to create transaction data");
    }
  }

  @override
  Future<Result<List<Transaction>>> getUserTransactions({
    required String uid,
  }) async {
    final firestore.CollectionReference<Map<String, dynamic>> transactions =
        _firestore.collection("transactions");

    try {
      final result = await transactions.where("uid", isEqualTo: uid).get();

      if (result.docs.isNotEmpty) {
        return Result.ok(
          result.docs.map((doc) => Transaction.fromJson(doc.data())).toList(),
        );
      } else {
        return Result.ok([]);
      }
    } catch (e) {
      return Result.error("Failed to get user transactions");
    }
  }
}
