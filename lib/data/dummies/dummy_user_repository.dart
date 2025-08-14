import "dart:io";

import "../../domain/entities/result.dart";
import "../../domain/entities/user.dart";
import "../repositories/user_repository.dart";

class DummyUserRepository implements UserRepository {
  @override
  Future<Result<User>> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> getUser({required String uid}) async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.ok(User(uid: uid, email: "dummy@gmail.com", name: "Dummy"));
  }

  @override
  Future<Result<int>> getUserBalance({required String uid}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUser({required User user}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUserBalance({
    required String uid,
    required int balance,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> uploadProfilePicture({
    required User user,
    required File image,
  }) {
    throw UnimplementedError();
  }
}
