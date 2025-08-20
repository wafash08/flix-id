import "../../data/repositories/authentication.dart";
import "../../data/repositories/user_repository.dart";
import "../entities/result.dart";
import "../entities/user.dart";
import "usecase.dart";

class GetLoggedInUser implements UseCase<Result<User>, void> {
  GetLoggedInUser({
    required Authentication authentication,
    required UserRepository userRepository,
  }) : _authentication = authentication,
       _userRepository = userRepository;

  final Authentication _authentication;
  final UserRepository _userRepository;

  @override
  Future<Result<User>> execute(void _) async {
    final String? loggedId = _authentication.getLoggedInUserId();

    if (loggedId != null) {
      final Result<User> userResult = await _userRepository.getUser(
        uid: loggedId,
      );

      return switch (userResult) {
        Success(val: final user) => Result.ok(user),
        Failure(:final err) => Result.error(err),
      };
    } else {
      return const Result.error("No user logged in");
    }
  }
}
