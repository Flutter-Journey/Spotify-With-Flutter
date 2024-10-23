import 'package:dartz/dartz.dart';
import 'package:spotify_with_flutter/core/usecase/usecase.dart';
import 'package:spotify_with_flutter/domain/repository/song/song.dart';
import 'package:spotify_with_flutter/service_locator.dart';

class AddOrRemoveFavoriteSongUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongsRepository>().addOrRemoveFavoriteSong(params!);
  }
}
