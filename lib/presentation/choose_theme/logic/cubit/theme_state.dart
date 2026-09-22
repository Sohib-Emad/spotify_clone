part of 'theme_cubit.dart';

sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class ThemeUpdated extends ThemeState {
  final bool isDarkMode;

  ThemeUpdated({required this.isDarkMode});
}

