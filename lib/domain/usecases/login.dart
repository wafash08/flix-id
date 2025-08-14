import "../../data/repositories/authentication.dart";
import "../../data/repositories/user_repository.dart";
import "../entities/result.dart";
import "../entities/user.dart";
import "usecase.dart";

class LoginParams {
  LoginParams({required this.email, required this.password});

  final String email;
  final String password;
}

class Login implements UseCase<Result<User>, LoginParams> {
  Login({required this.authentication, required this.userRepository});

  final Authentication authentication;
  final UserRepository userRepository;

  @override
  Future<Result<User>> call(LoginParams params) async {
    final Result<String> idResult = await authentication.login(
      email: params.email,
      password: params.password,
    );

    if (idResult.isSuccess) {
      final Result<User> userResult = await userRepository.getUser(
        uid: idResult.resultValue!,
      );

      return switch (userResult) {
        Ok(value: final user) => Result.ok(user),
        Failure(error: final err) => Result.error(
          err ?? Exception("getUser failed"),
        ),
      };
    } else {
      return Result.error(idResult.error ?? Exception("login failed"));
    }
  }
}
