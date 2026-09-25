import 'package:flutter/material.dart';
import 'package:spotify/common/widgets/appBar/basic_app_bar.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/presentation/home/pages/lyrics_screen.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 12),
              BasicAppBar(
                title: Text('Now playing'),
                action: Icon(Icons.more_vert),
              ),
              const SizedBox(height: 16),
              Expanded(
                flex: 8,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Image.asset(
                      AppImages.home1,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Bad Guy',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Billie Eilish',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.favorite_border_outlined),
                ],
              ),
              const SizedBox(height: 16),
              _ProgressBar(currentSeconds: 145, totalSeconds: 242),
              const SizedBox(height: 8),
              const _PlayerControls(),
              const Spacer(flex: 1),
              const _DraggableLyricsBar(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _DraggableLyricsBar extends StatefulWidget {
  const _DraggableLyricsBar();

  @override
  State<_DraggableLyricsBar> createState() => _DraggableLyricsBarState();
}

class _DraggableLyricsBarState extends State<_DraggableLyricsBar>
    with SingleTickerProviderStateMixin {
  static const double _maxDragUp = -140;
  static const double _viaVelocity = -400;
  static const double _viaDistance = 0.7;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 220),
  );

  double _dragY = 0;
  double _snapFrom = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (mounted) {
        setState(() => _dragY = _snapFrom * (1 - _controller.value));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openLyrics() {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        transitionDuration: const Duration(milliseconds: 320),
        reverseTransitionDuration: const Duration(milliseconds: 220),
        pageBuilder: (_, _, _) => const LyricsScreen(),
        transitionsBuilder: (_, animation, _, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          );
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          );
        },
      ),
    );
  }

  void _animateBack() {
    _snapFrom = _dragY;
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragUpdate: (details) {
        _controller.stop();
        setState(() {
          _dragY = (_dragY + details.delta.dy).clamp(_maxDragUp, 0.0);
        });
      },
      onVerticalDragEnd: (details) {
        final velocity = details.primaryVelocity ?? 0;
        final openedByVelocity = velocity < _viaVelocity;
        final openedByDistance = _dragY < _maxDragUp * _viaDistance;
        if (openedByVelocity || openedByDistance) {
          _openLyrics();
          setState(() => _dragY = 0);
        } else {
          _animateBack();
        }
      },
      child: Transform.translate(
        offset: Offset(0, _dragY),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.s, height: 30, width: 30),
            const SizedBox(height: 2),
            const Text(
              'Lyrics',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final int currentSeconds;
  final int totalSeconds;

  const _ProgressBar({
    required this.currentSeconds,
    required this.totalSeconds,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          _format(currentSeconds),
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
              activeTrackColor: const Color(0xff42C83C),
              inactiveTrackColor: Colors.grey.shade300,
              thumbColor: const Color(0xff42C83C),
            ),
            child: Slider(
              value: currentSeconds.toDouble().clamp(
                0,
                totalSeconds.toDouble(),
              ),
              max: totalSeconds.toDouble(),
              onChanged: (_) {},
            ),
          ),
        ),
        Text(
          _format(totalSeconds),
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }

  String _format(int seconds) {
    final m = (seconds ~/ 60).toString();
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(Icons.shuffle, size: 26, color: Colors.grey),
        const Icon(Icons.skip_previous, size: 36, color: Colors.black),
        Container(
          width: 74,
          height: 74,
          decoration: const BoxDecoration(
            color: Color(0xff42C83C),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.play_arrow_rounded,
            size: 46,
            color: Colors.white,
          ),
        ),
        const Icon(Icons.skip_next, size: 36, color: Colors.black),
        const Icon(Icons.repeat, size: 26, color: Colors.grey),
      ],
    );
  }
}
