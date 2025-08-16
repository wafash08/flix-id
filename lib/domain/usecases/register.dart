import "../../data/repositories/authentication.dart";
import "../../data/repositories/user_repository.dart";
import "../entities/result.dart";
import "../entities/user.dart";
import "usecase.dart";

class RegisterParams {
  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    this.photoUrl,
  });

  final String name;
  final String email;
  final String password;
  final String? photoUrl;
}

class Register implements UseCase<Result<User>, RegisterParams> {
  Register({required this.authentication, required this.userRepository});

  final Authentication authentication;
  final UserRepository userRepository;

  @override
  Future<Result<User>> execute(RegisterParams params) async {
    final Result<String> uidResult = await authentication.register(
      email: params.email,
      password: params.password,
    );

    if (uidResult.isSuccess) {
      final Result<User> userResult = await userRepository.createUser(
        uid: uidResult.value!,
        name: params.name,
        email: params.email,
        photoUrl: params.photoUrl,
      );

      return switch (userResult) {
        Success(val: final user) => Result.ok(user),
        Failure(:final err) => Result.error(err),
      };
    } else {
      return Result.error(uidResult.error ?? "register failed");
    }
  }
}
