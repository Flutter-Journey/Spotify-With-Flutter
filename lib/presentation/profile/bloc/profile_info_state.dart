import 'package:spotify_with_flutter/domain/entities/auth/user.dart';

abstract class ProfileInfoState {}

class ProfileInfoLoading extends ProfileInfoState {}

class ProfileInfoLoaded extends ProfileInfoState {
  final UserEntity userEntity;

  ProfileInfoLoaded({
    required this.userEntity,
  });
}

class ProfileInfoFailure extends ProfileInfoState {}
