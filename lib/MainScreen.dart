import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:muslim/HomePage.dart';
import 'package:muslim/storyScreen.dart';
import 'package:muslim/prayerScreen.dart';
import 'package:muslim/quranScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectindex = 0;
  List<Widget> _widgetsList = [
    HomeScreen(),
    QuranScreen(),
    AudioSreen(),
    PrayerScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: _widgetsList[selectindex],
            bottomNavigationBar: ConvexAppBar(
              items: [
                TabItem(
                    icon: Image.asset(
                      'assets/home.png',
                      color: Colors.white,
                    ),
                    title: 'Home'),
                TabItem(
                    icon: Image.asset(
                      'assets/holyQuran.png',
                      color: Colors.white,
                    ),
                    title: 'Quran'),
                TabItem(
                    icon: Image.asset(
                      'assets/story.png',
                      color: Colors.white,
                    ),
                    title: 'Story'),
                TabItem(
                    icon: Image.asset(
                      'assets/mosque.png',
                      color: Colors.white,
                    ),
                    title: 'Prayer'),
              ],
              initialActiveIndex: 0,
              onTap: updateIndex,
              backgroundColor: Colors.blue,
              activeColor: Colors.blue,
            )));
  }

  void updateIndex(index) {
    setState(() {
      selectindex = index;
    });
  }
}
