import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/presentation/intro/pages/intro_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();
    navigateToIntro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: SvgPicture.asset(AppVectors.splash)));
  }

  Future<void> navigateToIntro() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (BuildContext context) => IntroScreen()),
    );
  }
}
