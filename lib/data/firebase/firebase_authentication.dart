import "package:firebase_auth/firebase_auth.dart" as firebase_auth;

import "../../domain/entities/result.dart";
import "../repositories/authentication.dart";

class FirebaseAuthentication implements Authentication {
  FirebaseAuthentication({firebase_auth.FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  @override
  String? getLoggedInUserId() {
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final firebase_auth.UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return Result.ok(credential.user!.uid);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return Result.error(e.message ?? "Firebase auth exception");
    }
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
