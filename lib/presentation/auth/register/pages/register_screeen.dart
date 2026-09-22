import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appBar/basic_app_bar.dart';
import 'package:spotify/common/widgets/button/app_primary_button.dart';
import 'package:spotify/common/widgets/textform/tex_form_field.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/main/pages/root_screen.dart';
import 'package:spotify/presentation/auth/login/pages/login_screen.dart';

class RegisterScreeen extends StatefulWidget {
  const RegisterScreeen({super.key});

  @override
  State<RegisterScreeen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreeen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final contentColor = isDark ? Colors.white : const Color(0xff383838);

    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(AppVectors.splash, width: 108, height: 33),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Register',
                style: TextStyle(
                  color: contentColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              RichText(
                text: TextSpan(
                  text: 'If you need any support',
                  style: TextStyle(color: contentColor, fontSize: 12),
                  children: [
                    TextSpan(
                      text: ' click here',
                      style: TextStyle(
                        color: Color(0xff1DB954),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              TexFormField(
                hintText: 'Full Name',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              TexFormField(
                hintText: 'Enter Username Or Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TexFormField(
                hintText: 'Password',
                obscureText: _obscurePassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      AppImages.hide,
                      fit: BoxFit.contain,
                      color: _obscurePassword ? null : AppColors.primaryColor,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),
              BasicAppButton(
                textStyle: TextStyle(fontSize: 20, color: Colors.white),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const RootScreen()),
                  );
                },
                title: 'creat account',
                height: 80,
              ),

              const SizedBox(height: 10),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Or',
                      style: TextStyle(color: contentColor, fontSize: 12),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(AppImages.googel, width: 30, height: 30),
                  Image.asset(AppImages.ios, height: 30, width: 30),
                ],
              ),

              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Do you have an account?',
                    style: TextStyle(color: contentColor, fontSize: 15),

                    children: [
                      TextSpan(
                        text: 'sign In',
                        style: TextStyle(
                          color: Color(0xff288CE9),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
