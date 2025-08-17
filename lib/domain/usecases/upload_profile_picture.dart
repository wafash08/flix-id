import "dart:io";

import "../../data/repositories/user_repository.dart";
import "../entities/result.dart";
import "../entities/user.dart";
import "usecase.dart";

class UploadProfilePictureParams {
  UploadProfilePictureParams({required this.image, required this.user});

  final File image;
  final User user;
}

class UploadProfilePicture
    implements UseCase<Result<User>, UploadProfilePictureParams> {
  final UserRepository _userRepository;

  UploadProfilePicture({required UserRepository userRepository})
    : _userRepository = userRepository;

  @override
  Future<Result<User>> execute(UploadProfilePictureParams params) async {
    return _userRepository.uploadProfilePicture(
      image: params.image,
      user: params.user,
    );
  }
}
