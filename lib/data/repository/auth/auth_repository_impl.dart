import 'package:spotify_with_flutter/data/models/auth/create_user_req.dart';
import 'package:spotify_with_flutter/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_with_flutter/domain/repository/auth/auth.dart';
import 'package:spotify_with_flutter/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserReq createUserReq) async {
    await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
