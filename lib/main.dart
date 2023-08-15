import 'package:flutter/material.dart';
import 'package:muslim/SplashScreen.dart';
import 'package:muslim/juz_screen.dart';
import 'package:muslim/surah_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muslim Hearth',
      home: SplashScreen(),
      routes: {
        JuzScreen.id: (context) => JuzScreen(),
        Surahdetail.id: (context) => Surahdetail(),
      },
    );
  }
}
