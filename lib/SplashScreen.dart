import 'dart:async';

import 'package:flutter/material.dart';
import 'package:muslim/onboarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnBoarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            const Center(
              child: Text('Muslim Hearth',
                  style: TextStyle(fontSize: 40, color: Colors.purple)),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              child: Image.asset('assets/islamic.png'),
            ),
          ],
        ),
      ),
    );
  }
}
