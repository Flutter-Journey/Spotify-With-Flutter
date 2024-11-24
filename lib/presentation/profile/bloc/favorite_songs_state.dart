import 'package:spotify_with_flutter/domain/entities/songs/songs.dart';

abstract class FavoriteSongsState {}

class FavoriteSongsLoading extends FavoriteSongsState {}

class FavoriteSongsLoaded extends FavoriteSongsState {
  final List<SongEntity> favoriteSongs;

  FavoriteSongsLoaded({
    required this.favoriteSongs,
  });
}

class FavoriteSongsFailure extends FavoriteSongsState {}
