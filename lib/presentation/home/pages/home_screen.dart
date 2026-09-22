import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/presentation/home/widgets/news_continer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppImages.Search, height: 25, width: 25),
                    SvgPicture.asset(
                      AppVectors.splash,
                      height: 50,
                      width: 50,
                    ),
                    const Icon(
                      Icons.more_vert,
                      size: 30,
                      color: Color(0xff7D7D7D),
                    ),
                  ],
                ),
                Image.asset(AppImages.home, height: 190, width: 350),
                const SizedBox(height: 8),
                TabBar(
                  labelColor: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: const Color(0xff42C83C),
                  dividerColor: Colors.transparent,

                  tabs: const [
                    Tab(text: 'News'),
                    Tab(text: 'Video'),
                    Tab(text: 'Artists'),
                    Tab(text: 'Podcast'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      const _NewsTab(),
                      const _VideoTab(),
                      const _ArtistsTab(),
                      const _PodcastTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NewsTab extends StatelessWidget {
  const _NewsTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const NewsContainer(),
              const SizedBox(width: 15),

              const NewsContainer(),
              const SizedBox(width: 15),

              const NewsContainer(),
              const SizedBox(width: 15),

              const NewsContainer(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ' Playlist',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Text(
              'see more',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffE6E6E6),
              ),
              child: Center(
                child: SvgPicture.asset(AppVectors.play, height: 17, width: 17),
              ),
            ),

            Column(
              children: [
                Text(
                  ' As It Was',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                Text(
                  'Harry Styles',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),

            Text('5:33'),

            Icon(Icons.favorite, color: Colors.grey),
          ],
        ),
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffE6E6E6),
              ),
              child: Center(
                child: SvgPicture.asset(AppVectors.play, height: 17, width: 17),
              ),
            ),

            Column(
              children: [
                Text(
                  ' God Did',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                Text(
                  'DJ Khaled',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),

            Text('3:43'),

            Icon(Icons.favorite, color: Colors.grey),
          ],
        ),
        ],
      ),
    );
  }
}

class _VideoTab extends StatelessWidget {
  const _VideoTab();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Video'));
  }
}

class _ArtistsTab extends StatelessWidget {
  const _ArtistsTab();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Artists'));
  }
}

class _PodcastTab extends StatelessWidget {
  const _PodcastTab();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Podcast'));
  }
}
