import 'package:spotify_with_flutter/core/usecase/usecase.dart';
import 'package:spotify_with_flutter/domain/repository/song/song.dart';
import 'package:spotify_with_flutter/service_locator.dart';

class IsFavoriteSongUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return sl<SongsRepository>().isFavoriteSong(params!);
  }
}
