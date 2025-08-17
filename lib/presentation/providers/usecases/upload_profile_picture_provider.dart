import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../domain/usecases/upload_profile_picture.dart";
import "../repositories/user_repository_provider.dart";

part "upload_profile_picture_provider.g.dart";

@riverpod
UploadProfilePicture uploadProfilePicture(Ref ref) =>
    UploadProfilePicture(userRepository: ref.watch(userRepositoryProvider));
