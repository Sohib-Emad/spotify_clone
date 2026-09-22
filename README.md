# Spotify Clone 🎧

A Spotify UI clone built with **Flutter**. It includes the on-boarding flow, theme selection (dark/light), and authentication screens with a clean, responsive design.

## ✨ Features

- 🌗 Dark / Light theme toggle (Bloc state management with `ThemeCubit`)
- Splash screen with animated navigation
- Intro screen with "Get Started"
- Choose your mode screen (Dark / Light)
- Register / Sign-in landing page
- Login screen with form validation and show/hide password
- Reusable widgets (`BasicAppBar`, `BasicAppButton`, `TexFormField`)

## 🛠️ Tech Stack

- [Flutter](https://flutter.dev) — UI framework
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) — state management
- hydrated_bloc, flutter_svg, path_provider

## 📸 Screenshots

| | | |
|:-:|:-:|:-:|
| Splash | Intro | Choose Mode |
| ![Splash](assets/appScreens/1.png) | ![Intro](assets/appScreens/2.png) | ![Choose Mode](assets/appScreens/3.png) |
| Register / Sign in | Login | Login (with password) |
| ![Register](assets/appScreens/4.png) | ![Login](assets/appScreens/5.png) | ![Login Password](assets/appScreens/6.png) |
| Home |||
| ![Home](assets/appScreens/home_screen.png) |||

## 🚀 Getting Started

1. Clone the repository:

```bash
git clone https://github.com/Sohib-Emad/spotify_clone.git
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

## 📄 License

This project is for learning/educational purposes only.