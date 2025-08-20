import "dart:io";

import "package:flix_id/domain/entities/result.dart";
import "package:flutter/foundation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../domain/entities/user.dart";
import "../../domain/usecases/login.dart";
import "../../domain/usecases/register.dart";
import "../../domain/usecases/top_up.dart";
import "../../domain/usecases/upload_profile_picture.dart";
import "movie/now_playing_provider.dart";
import "movie/upcoming_provider.dart";
import "transaction_data_provider.dart";
import "usecases/get_logged_in_user_provider.dart";
import "usecases/login_provider.dart";
import "usecases/logout_provider.dart";
import "usecases/register_provider.dart";
import "usecases/top_up_provider.dart";
import "usecases/upload_profile_picture_provider.dart";

part "user_data_provider.g.dart";

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  Future<User?> build() async {
    final Result<User> result = await ref
        .read(getLoggedInUserProvider)
        .execute(null);

    switch (result) {
      case Success(val: final user):
        _getMovies();
        return user;
      case Failure(err: _):
        return null;
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();

    final Result<User> result = await ref
        .read(loginProvider)
        .execute(LoginParams(email: email, password: password));

    switch (result) {
      case Success(val: final user):
        _getMovies();
        state = AsyncData(user);
        break;
      case Failure(err: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
        break;
    }
  }

  Future<void> register({
    required String email,
    required String name,
    required String password,
    String? photoUrl,
  }) async {
    state = const AsyncLoading();

    final Result<User> result = await ref
        .read(registerProvider)
        .execute(
          RegisterParams(
            email: email,
            name: name,
            password: password,
            photoUrl: photoUrl,
          ),
        );

    switch (result) {
      case Success(val: final user):
        _getMovies();
        state = AsyncData(user);
        break;
      case Failure(err: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
        break;
    }
  }

  Future<void> refreshUserData() async {
    final Result<User> result = await ref
        .read(getLoggedInUserProvider)
        .execute(null);

    if (result case Success(val: final user)) {
      state = AsyncData(user);
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();

    final Result<void> result = await ref.read(logoutProvider).execute(null);

    switch (result) {
      case Success(val: _):
        state = const AsyncData(null);
        break;
      case Failure(err: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = AsyncData(state.valueOrNull);
        break;
    }
  }

  Future<void> topUp(int amount) async {
    final String? userId = state.valueOrNull?.uid;

    if (userId != null) {
      final Result<void> result = await ref
          .read(topUpProvider)
          .execute(TopUpParams(amount: amount, userId: userId));

      if (result.isSuccess) {
        await refreshUserData();
        await ref
            .read(transactionDataProvider.notifier)
            .refreshTransactionData();
      }
    }
  }

  Future<void> uploadProfilePicture({
    required User user,
    required File image,
  }) async {
    final Result<User> result = await ref
        .read(uploadProfilePictureProvider)
        .execute(UploadProfilePictureParams(image: image, user: user));

    if (result case Success(val: final user)) {
      state = AsyncData(user);
    }
  }

  void _getMovies() async {
    await ref.read(nowPlayingProvider.notifier).getMovies();
    await ref.read(upcomingProvider.notifier).getMovies();
  }
}
