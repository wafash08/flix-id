import "../../data/repositories/user_repository.dart";
import "../entities/result.dart";
import "usecase.dart";

class GetUserBalanceParams {
  GetUserBalanceParams({required this.userId});

  final String userId;
}

class GetUserBalance implements UseCase<Result<int>, GetUserBalanceParams> {
  final UserRepository _userRepository;

  GetUserBalance({required UserRepository userRepository})
    : _userRepository = userRepository;

  @override
  Future<Result<int>> execute(GetUserBalanceParams params) async {
    return _userRepository.getUserBalance(uid: params.userId);
  }
}
