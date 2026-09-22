import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _green = Color(0xff42C83C);
  static const _gray = Color(0xff7D7D7D);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                selected: currentIndex == 0,
                icon: SvgPicture.asset(
                  AppVectors.homeNav,
                  width: 30,
                  height: 30,
                ),
                onTap: () => onTap(0),
              ),
              _NavItem(
                selected: currentIndex == 1,
                icon: SvgPicture.asset(
                  AppVectors.exploreNav,
                  width: 30,
                  height: 30,
                ),
                onTap: () => onTap(1),
              ),
              _NavItem(
                selected: currentIndex == 2,
                icon: SvgPicture.asset(
                  AppVectors.heartNav,
                  width: 30,
                  height: 30,
                ),
                onTap: () => onTap(2),
              ),
              _NavItem(
                selected: currentIndex == 3,
                icon: SvgPicture.asset(
                  AppVectors.profileNav,
                  width: 30,
                  height: 30,
                ),
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final Widget icon;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: SizedBox(
          width: 28,
          height: 28,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              selected ? BottomNavBar._green : BottomNavBar._gray,
              BlendMode.srcIn,
            ),
            child: icon,
          ),
        ),
      ),
    );
  }
}
