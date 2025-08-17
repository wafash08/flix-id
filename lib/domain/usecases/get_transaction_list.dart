import "../../data/repositories/transaction_repository.dart";
import "../entities/result.dart";
import "../entities/transaction.dart";
import "usecase.dart";

class GetTransactionListParams {
  GetTransactionListParams({required this.uid});

  final String uid;
}

class GetTransactionList
    implements UseCase<Result<List<Transaction>>, GetTransactionListParams> {
  final TransactionRepository _transactionRepository;

  GetTransactionList({required TransactionRepository transactionRepository})
    : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> execute(
    GetTransactionListParams params,
  ) async {
    final movieDetailResult = await _transactionRepository.getUserTransactions(
      uid: params.uid,
    );

    return switch (movieDetailResult) {
      Success(val: final transactionList) => Result.ok(transactionList),
      Failure(:final err) => Result.error(err),
    };
  }
}
