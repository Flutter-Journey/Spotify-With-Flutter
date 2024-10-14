import 'package:dartz/dartz.dart';
import 'package:spotify_with_flutter/core/usecase/usecase.dart';
import 'package:spotify_with_flutter/domain/repository/song/song.dart';
import 'package:spotify_with_flutter/service_locator.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return sl<SongsRepository>().getNewsSongs();
  }
}
