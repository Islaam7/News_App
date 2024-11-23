import 'package:flutter/material.dart';
import 'package:news_app/screens/explore_page.dart';
import 'package:news_app/screens/home_page.dart';
import 'package:news_app/screens/profile_page.dart';
import 'package:news_app/screens/saved_news_page.dart';
import 'package:news_app/values/colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomNaviBar extends StatefulWidget {
  const CustomNaviBar({super.key});

  @override
  State<CustomNaviBar> createState() => _CustomNaviBarState();
}

class _CustomNaviBarState extends State<CustomNaviBar> {
  final List<Widget> _Activityes = [
    HomePage(),
    ExplorePage(),
    SavedNewsPage(),
    ProfilePage()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(opacity : 0.5,child: Divider(indent: 10, height: 0.5)),
            SalomonBottomBar(
                backgroundColor: MyColor.white,
                currentIndex: _currentIndex,
                onTap: (i) => setState(() {
                      _currentIndex = i;
                    }),
                items: [
                  SalomonBottomBarItem(
                    icon: Image.asset(
                      'lib/assets/icons/home.png',
                      width: 24,
                      height: 24,
                      color: _currentIndex == 0 ? MyColor.blue : Colors.grey,
                    ),
                    title: const Text('Home'),
                      selectedColor: MyColor.blue

                  ),
                  SalomonBottomBarItem(
                    icon: Image.asset(
                      'lib/assets/icons/earth.png',
                      width: 24,
                      height: 24,
                      color: _currentIndex == 1 ? MyColor.blue : Colors.grey,
                    ),
                    title: const Text('Explore'),
                      selectedColor: MyColor.blue

                  ),
                  SalomonBottomBarItem(
                    icon: Image.asset(
                      'lib/assets/icons/save.png',
                      width: 24,
                      height: 24,
                      color: _currentIndex == 2 ? MyColor.blue : Colors.grey,
                    ),
                    title: const Text('Saved'),
                      selectedColor: MyColor.blue
                  ),
                  SalomonBottomBarItem(
                    icon: Image.asset(
                      'lib/assets/icons/user.png',
                      width: 24,
                      height: 24,
                      color: _currentIndex == 1 ? MyColor.blue : Colors.grey,
                    ),
                    title: const Text('Profile'),
                    selectedColor: MyColor.blue
                  )
                ]),
          ],
        ),
      ),
      body: _Activityes[_currentIndex],
    );
  }
}
