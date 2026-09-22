import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/config/theme/app_theme.dart';
import 'package:spotify/presentation/choose_theme/logic/cubit/theme_cubit.dart';
import 'package:spotify/presentation/splash/pages/splash.dart';

void main()  {
  
  runApp(const SpotifyApp());
}

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final themeMode = switch (state) {
            ThemeUpdated(isDarkMode: true) => ThemeMode.dark,
            _ => ThemeMode.light,
          };
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Spotify Clone',
            theme: AppTheme.lightTheme,
            themeMode: themeMode,
            darkTheme: AppTheme.darkTheme,
            home: const Splash(),
          );
        },
      ),
    );
  }
}
