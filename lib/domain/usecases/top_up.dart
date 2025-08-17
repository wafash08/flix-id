import "../../data/repositories/transaction_repository.dart";
import "../entities/result.dart";
import "../entities/transaction.dart";
import "create_transaction.dart";
import "usecase.dart";

class TopUpParams {
  TopUpParams({required this.amount, required this.userId});

  final int amount;
  final String userId;
}

class TopUp implements UseCase<Result<void>, TopUpParams> {
  final TransactionRepository _transactionRepository;

  TopUp({required TransactionRepository transactionRepository})
    : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> execute(TopUpParams params) async {
    final CreateTransaction createTransaction = CreateTransaction(
      transactionRepository: _transactionRepository,
    );
    final int transactionTime = DateTime.now().millisecondsSinceEpoch;
    final movieDetailResult = await createTransaction.execute(
      CreateTransactionParams(
        transaction: Transaction(
          uid: params.userId,
          title: "Top Up",
          id: "flx-$transactionTime-${params.userId}",
          adminFee: 0,
          total: -params.amount,
          transactionTime: transactionTime,
        ),
      ),
    );

    return switch (movieDetailResult) {
      Success(val: _) => Result.ok(null),
      Failure(err: _) => Result.error("Failed to top up"),
    };
  }
}
