import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_with_flutter/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:spotify_with_flutter/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:spotify_with_flutter/core/configs/theme/app_color.dart';
import 'package:spotify_with_flutter/domain/entities/songs/songs.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  final double sizeIcons;
  final Function? function;

  const FavoriteButton({
    super.key,
    required this.songEntity,
    this.sizeIcons = 25,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
              onPressed: () async {
                await context.read<FavoriteButtonCubit>().favoriteButtonUpdated(
                      songEntity.songId,
                    );

                if (function != null) {
                  function!();
                }
              },
              icon: Icon(
                songEntity.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
                size: sizeIcons,
                color: AppColors.darkGrey,
              ),
            );
          }

          if (state is FavoriteButtonUpdated) {
            return IconButton(
              onPressed: () {
                context.read<FavoriteButtonCubit>().favoriteButtonUpdated(
                      songEntity.songId,
                    );
              },
              icon: Icon(
                state.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
                size: sizeIcons,
                color: AppColors.darkGrey,
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
