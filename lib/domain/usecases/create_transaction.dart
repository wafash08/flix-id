import "../../data/repositories/transaction_repository.dart";
import "../entities/result.dart";
import "../entities/transaction.dart";
import "usecase.dart";

class CreateTransactionParams {
  CreateTransactionParams({required this.transaction});

  final Transaction transaction;
}

class CreateTransaction
    implements UseCase<Result<void>, CreateTransactionParams> {
  final TransactionRepository _transactionRepository;

  CreateTransaction({required TransactionRepository transactionRepository})
    : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> execute(CreateTransactionParams params) async {
    final int transactionTime = DateTime.now().millisecondsSinceEpoch;
    final movieDetailResult = await _transactionRepository.createTransaction(
      transaction: params.transaction.copyWith(
        transactionTime: transactionTime,
        id:
            params.transaction.id ??
            "flx-$transactionTime-${params.transaction.uid}",
      ),
    );

    return switch (movieDetailResult) {
      Success(val: _) => Result.ok(null),
      Failure(:final err) => Result.error(err),
    };
  }
}
