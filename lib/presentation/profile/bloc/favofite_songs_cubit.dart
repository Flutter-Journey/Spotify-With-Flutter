import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_with_flutter/domain/entities/songs/songs.dart';
import 'package:spotify_with_flutter/domain/usecase/song/get_favorite_songs.dart';
import 'package:spotify_with_flutter/presentation/profile/bloc/favorite_songs_state.dart';
import 'package:spotify_with_flutter/service_locator.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoriteSongsLoading());

  List<SongEntity> favoriteSongs = [];

  Future<void> getFavoriteSongs() async {
    var result = await sl<GetFavoriteSongsUseCase>().call();

    result.fold(
      (l) {
        emit(
          FavoriteSongsFailure(),
        );
      },
      (r) {
        favoriteSongs = r;
        emit(
          FavoriteSongsLoaded(favoriteSongs: favoriteSongs),
        );
      },
    );
  }

  Future<void> removeSong(int index) async {
    favoriteSongs.removeAt(index);

    emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
  }
}
