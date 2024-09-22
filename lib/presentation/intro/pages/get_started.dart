import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_with_flutter/common/basic_app_button.dart';
import 'package:spotify_with_flutter/core/configs/assets/app_images.dart';
import 'package:spotify_with_flutter/core/configs/assets/app_vectors.dart';
import 'package:spotify_with_flutter/core/configs/theme/app_color.dart';
import 'package:spotify_with_flutter/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 50,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  AppImages.introBG,
                ),
              ),
            ),
            // child:
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 40.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                const Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'The customer is very important, the customer will be followed by the customer. For the arrows are clear but phaseless. It\'s time to decorate it with some chocolate.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyTitle,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ChooseModePage(),
                      ),
                    );
                  },
                  title: "Get Start",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
