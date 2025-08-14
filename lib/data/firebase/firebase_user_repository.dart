import "dart:io";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:path/path.dart";

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
  }) async {
    try {
      final CollectionReference<Map<String, dynamic>> users = _firestore
          .collection("users");

      await users.doc(uid).set({
        "uid": uid,
        "email": email,
        "name": name,
        "photoUrl": photoUrl,
        "balance": balance,
      });

      final DocumentSnapshot<Map<String, dynamic>> result =
          await users.doc(uid).get();

      if (result.exists) {
        return Result.ok(User.fromJson(result.data()!));
      } else {
        return Result.error("Failed to create user data");
      }
    } on FirebaseException catch (e) {
      return Result.error("${e.message}");
    }
  }

  @override
  Future<Result<User>> getUser({required String uid}) async {
    try {
      final DocumentReference<Map<String, dynamic>> docRef = _firestore.doc(
        "users/$uid",
      );
      final DocumentSnapshot<Map<String, dynamic>> result = await docRef.get();

      if (result.exists) {
        return Result.ok(User.fromJson(result.data()!));
      } else {
        return Result.error("User not found");
      }
    } on FirebaseException catch (e) {
      return Result.error("${e.message}");
    }
  }

  @override
  Future<Result<int>> getUserBalance({required String uid}) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> result =
          await _firestore.doc("users/$uid").get();

      if (result.exists) {
        return Result.ok(result.data()!["balance"]);
      } else {
        return Result.error("User not found");
      }
    } on FirebaseException catch (e) {
      return Result.error("${e.message}");
    }
  }

  @override
  Future<Result<User>> updateUser({required User user}) async {
    try {
      final DocumentReference<Map<String, dynamic>> docRef = _firestore.doc(
        "users/${user.uid}",
      );
      await docRef.update(user.toJson());

      final DocumentSnapshot<Map<String, dynamic>> result = await docRef.get();

      if (result.exists) {
        final User updatedUser = User.fromJson(result.data()!);

        if (updatedUser == user) {
          return Result.ok(updatedUser);
        } else {
          return Result.error("Failed to update user data");
        }
      } else {
        return Result.error("Failed to update user data");
      }
    } on FirebaseException catch (e) {
      return Result.error("${e.message}");
    }
  }

  @override
  Future<Result<User>> updateUserBalance({
    required String uid,
    required int balance,
  }) async {
    try {
      final DocumentReference<Map<String, dynamic>> docRef = _firestore.doc(
        "users/$uid",
      );
      final DocumentSnapshot<Map<String, dynamic>> result = await docRef.get();

      if (result.exists) {
        await docRef.update({"balance": balance});

        final DocumentSnapshot<Map<String, dynamic>> updatedResult =
            await docRef.get();

        if (updatedResult.exists) {
          final User updatedUser = User.fromJson(updatedResult.data()!);
          if (updatedUser.balance == balance) {
            return Result.ok(updatedUser);
          } else {
            return Result.error("Failed to update user balance");
          }
        } else {
          return Result.error("Failed to retrieve updated user balance");
        }
      } else {
        return Result.error("User not found");
      }
    } on FirebaseException catch (e) {
      return Result.error("${e.message}");
    }
  }

  @override
  Future<Result<User>> uploadProfilePicture({
    required User user,
    required File image,
  }) async {
    final String filename = basename(image.path);
    final Reference reference = FirebaseStorage.instance.ref().child(filename);

    try {
      await reference.putFile(image);
      final String downloadUrl = await reference.getDownloadURL();
      final Result<User> updatedUser = await updateUser(
        user: user.copyWith(photoUrl: downloadUrl),
      );

      if (updatedUser.isSuccess) {
        return Result.ok(updatedUser.value!);
      } else {
        return Result.error(updatedUser.error!);
      }
    } catch (e) {
      return Result.error("Failed to upload profile picture");
    }
  }
}
