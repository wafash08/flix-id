import "../../data/repositories/authentication.dart";
import "../entities/result.dart";
import "usecase.dart";

class Login implements UseCase<Result<void>, void> {
  Login({required this.authentication});

  final Authentication authentication;

  @override
  Future<Result<void>> execute(void _) async {
    return authentication.logout();
  }
}
