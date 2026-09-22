import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/app_primary_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/presentation/choose_theme/logic/cubit/theme_cubit.dart';
import 'package:spotify/presentation/auth/register_or_signin/pages/register_or_sign.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.choose_theme_bg),
                fit: BoxFit.cover,
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
                  'Choose mode',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ThemeOption(
                      icon: AppVectors.moon,
                      label: 'Dark Mode',
                      themeMode: ThemeMode.dark,
                    ),
                    const SizedBox(width: 60),
                    _ThemeOption(
                      icon: AppVectors.sun,
                      label: 'Light Mode',
                      themeMode: ThemeMode.light,
                    ),
                  ],
                ),

                SizedBox(height: 50),

                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterOrSign
                        (),
                      ),
                    );
                  },
                  title: 'Continue',
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

class _ThemeOption extends StatelessWidget {
  const _ThemeOption({
    required this.icon,
    required this.label,
    required this.themeMode,
  });

  final String icon;
  final String label;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () =>
              context.read<ThemeCubit>().updateTheme(themeMode == ThemeMode.dark),
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff30393C).withOpacity(0.5),
                ),
                child: SvgPicture.asset(icon, fit: BoxFit.none),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Color(0xffDADADA),
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 110),
      ],
    );
  }
}
