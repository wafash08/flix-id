import "dart:io";

import "package:cloud_firestore/cloud_firestore.dart";

import "../../domain/entities/result.dart";
import "../../domain/entities/user.dart";
import "../repositories/user_repository.dart";

class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({FirebaseFirestore? firebaseFirestore})
    : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

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
    final DocumentReference<Map<String, dynamic>> docRef = _firestore.doc(
      "users/$uid",
    );
    final DocumentSnapshot<Map<String, dynamic>> result = await docRef.get();

    if (result.exists) {
      return Result.ok(User.fromJson(result.data()!));
    } else {
      return Result.error("User not found");
    }
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
