import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/app_primary_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/presentation/choose_theme/pages/choose_mode.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.intro_bg),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.15)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.splash),
                ),
                Spacer(),
                Text(
                  'Enjoy listening to music',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 21),
                Text(
                  'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Sagittis enim \n purus sed phasellus. Cursus ornare id \n scelerisque aliquam.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),

                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChooseMode(),
                      ),
                    );
                  },
                  title: 'Get Started',
                  height: 92,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
