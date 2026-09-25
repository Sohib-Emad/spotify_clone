import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:spotify/core/config/assets/app_images.dart';

class LyricsScreen extends StatelessWidget {
  const LyricsScreen({super.key});

  static const List<({String title, List<String> lines})> _sections = [
    (
      title: '( Verse 1)',
      lines: [
        'Sleepin\', you\'re on your tippy toes',
        'Creepin\' around like no one knows',
        'Think you\'re so criminal',
        'Bruises on both my knees for you',
        'Don\'t say thank you or please',
        'I do what I want when I\'m wanting to',
      ],
    ),
    (
      title: '( Verse 2)',
      lines: [
        'Sleepin\', you\'re on your tippy toes',
        'Creepin\' around like no one knows',
        'Think you\'re so criminal',
        'Bruises on both my knees for you',
        'My soul? So cynical',
        'I\'m the bad guy, duh',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: Image.asset(AppImages.home1, fit: BoxFit.cover),
            ),
          ),
          const Positioned.fill(child: ColoredBox(color: Color(0xB3000000))),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'Bad Guy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _sections.length,
                      itemBuilder: (context, sectionIndex) {
                        final section = _sections[sectionIndex];
                        final lines = section.lines;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: Text(
                                section.title,
                                style: const TextStyle(
                                  color: Color(0xFF9ED1A5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            for (var i = 0; i < lines.length; i++)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Text(
                                  lines[i],
                                  style: TextStyle(
                                    color: i == 3
                                        ? const Color(0xff42C83C)
                                        : Colors.white,
                                    fontSize: i == 3 ? 21 : 18,
                                    fontWeight: i == 3
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                    height: 1.25,
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: _MiniPlayer()),
        ],
      ),
    );
  }
}

class _MiniPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 16, 20, 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.favorite_border, color: Colors.black),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bad Guy',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Billie Eilish',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  color: Color(0xff42C83C),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text(
                '2:25',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Expanded(
                child: Container(
                  height: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xff42C83C),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const Text(
                '4:02',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
