import 'package:flutter/material.dart';
import 'package:spotify_with_flutter/common/helpers/is_dark_mode.dart';
import 'package:spotify_with_flutter/common/widgets/appbar/app_bar.dart';
import 'package:spotify_with_flutter/core/configs/theme/app_color.dart';
import 'package:spotify_with_flutter/core/constants/app_urls.dart';
import 'package:spotify_with_flutter/domain/entities/songs/songs.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;

  const SongPlayerPage({
    super.key,
    required this.songEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          'New playing',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        action: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert_rounded,
            color: context.isDarkMode
                ? const Color(0xff959595)
                : const Color(0xff555555),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              _songCover(context),
              const SizedBox(height: 10),
              _songDetail(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            '${AppUrls.fireStorage}${AppUrls.temp}${songEntity.idImg}.jpg?${AppUrls.mediaAlt}',
          ),
        ),
      ),
    );
  }

  Widget _songDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              songEntity.artist,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_rounded,
            size: 30,
            color: AppColors.darkGrey,
          ),
        ),
      ],
    );
  }
}
