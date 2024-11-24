import 'package:spotify_with_flutter/domain/entities/auth/user.dart';

class UserModel {
  String? email;
  String? fullName;
  String? imageURL;

  UserModel({
    this.email,
    this.fullName,
    this.imageURL,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    email = data['email'];
    fullName = data['name'];
    imageURL = data['imageURL'];
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      email: email!,
      fullName: fullName!,
      imageURL: imageURL!,
    );
  }
}
