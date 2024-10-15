import 'package:spotify_with_flutter/domain/entities/songs/songs.dart';

abstract class SongPlayerState {}

class SongPlayerLoading extends SongPlayerState {}

class SongPlayerLoaded extends SongPlayerState {
  final List<SongEntity> songs;
  SongPlayerLoaded({required this.songs});
}

class SongPlayerLoadFailure extends SongPlayerState {}
