import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_with_flutter/common/helpers/is_dark_mode.dart';
import 'package:spotify_with_flutter/common/widgets/appbar/app_bar.dart';
import 'package:spotify_with_flutter/common/widgets/favorite_button/favorite_button.dart';
import 'package:spotify_with_flutter/core/configs/theme/app_color.dart';
import 'package:spotify_with_flutter/core/constants/app_urls.dart';
import 'package:spotify_with_flutter/presentation/profile/bloc/favofite_songs_cubit.dart';
import 'package:spotify_with_flutter/presentation/profile/bloc/favorite_songs_state.dart';
import 'package:spotify_with_flutter/presentation/profile/bloc/profile_info_cubit.dart';
import 'package:spotify_with_flutter/presentation/profile/bloc/profile_info_state.dart';
import 'package:spotify_with_flutter/presentation/song_player.dart/pages/song_player.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        backgroundColor: AppColors.metalDark,
        title: Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileInfo(context),
          const SizedBox(height: 30),
          _favoriteSongs(),
        ],
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getUser(),
      child: Container(
        height: MediaQuery.of(context).size.height / 3.5,
        decoration: BoxDecoration(
          color: context.isDarkMode ? AppColors.metalDark : AppColors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
          builder: (context, state) {
            if (state is ProfileInfoLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }

            if (state is ProfileInfoLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(state.userEntity.imageURL!),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      state.userEntity.email!,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      state.userEntity.fullName!,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              );
            }

            if (state is ProfileInfoFailure) {
              return const Center(
                child: Text('Please try again'),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget _favoriteSongs() {
    return BlocProvider(
      create: (context) => FavoriteSongsCubit()..getFavoriteSongs(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('FAVORITE SONGS'),
            const SizedBox(height: 20),
            BlocBuilder<FavoriteSongsCubit, FavoriteSongsState>(
                builder: (context, state) {
              if (state is FavoriteSongsLoading) {
                return const CircularProgressIndicator();
              }

              if (state is FavoriteSongsLoaded) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SongPlayerPage(
                                        songEntity:
                                            state.favoriteSongs[index])));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // image songs
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      '${AppUrls.coverFireStorage}${AppUrls.temp}${state.favoriteSongs[index].idImg}.jpg?${AppUrls.mediaAlt}',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.favoriteSongs[index].title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    state.favoriteSongs[index].artist,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(state.favoriteSongs[index].duration
                                  .toString()
                                  .replaceAll('.', ':')),
                              const SizedBox(
                                width: 20,
                              ),
                              FavoriteButton(
                                songEntity: state.favoriteSongs[index],
                                key: UniqueKey(),
                                function: () {
                                  context
                                      .read<FavoriteSongsCubit>()
                                      .removeSong(index);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, state) =>
                      const SizedBox(height: 20),
                  itemCount: state.favoriteSongs.length,
                );
              }

              if (state is FavoriteSongsFailure) {
                return const Text('Please try again');
              }

              return Container();
            })
          ],
        ),
      ),
    );
  }
}
