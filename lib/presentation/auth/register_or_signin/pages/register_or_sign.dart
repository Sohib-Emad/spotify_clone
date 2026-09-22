import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appBar/basic_app_bar.dart';
import 'package:spotify/common/widgets/button/app_primary_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/auth/login/pages/login_screen.dart';
import 'package:spotify/presentation/auth/register/pages/register_screeen.dart';

class RegisterOrSign extends StatelessWidget {
  const RegisterOrSign({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final contentColor = isDark ? Colors.white : const Color(0xff383838);
    final subtitleColor = isDark
        ? AppColors.grayColor
        : const Color(0xff797979);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          const BasicAppBar(),

          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.auth_bg),
          ),

          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                const Spacer(),
                SvgPicture.asset(AppVectors.splash),
                const SizedBox(height: 20),
                Text(
                  'Enjoy listening to music',
                  style: TextStyle(
                    color: contentColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 21),
                Text(
                  'Spotify is a proprietary Swedish audio \nstreaming and media services provider ',
                  style: TextStyle(
                    color: subtitleColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BasicAppButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreeen(),
                            ),
                          );
                        },
                        title: 'Register',
                        textStyle: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffF6F6F6),
                        ),
                        height: 73,
                        width: 147,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: isDark
                                ? Colors.white
                                : AppColors.darkBackgroundColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
