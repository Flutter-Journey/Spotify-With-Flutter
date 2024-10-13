import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_with_flutter/domain/usecase/song/get_news_songs.dart';
import 'package:spotify_with_flutter/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify_with_flutter/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();

    returnedSongs.fold(
      (l) {
        emit(NewsSongsLoadFailure());
      },
      (data) {
        emit(
          NewsSongsLoaded(songs: data),
        );
      },
    );
  }
}
