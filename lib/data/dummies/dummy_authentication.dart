import "../../domain/entities/result.dart";
import "../repositories/authentication.dart";

class DummyAuthentication implements Authentication {
  @override
  String? getLoggedInUserId() {
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.ok("ID-1234");
    // return Result.error("Login failed");
  }

  @override
  Future<Result<void>> logout() {
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> register({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
