import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:muslim/MainScreen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            //indroduction Quran
            PageViewModel(
              title: "Read Quran",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Customize your reading view, in read in multiple language, listen differnt audio",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              image: Center(
                  child: Image.asset(
                'assets/quran.png',
                fit: BoxFit.fitWidth,
              )),
            ),
//indroduction prayer
            PageViewModel(
              title: "Prayer Alerts",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Chose your adhan, which prayer to be notified of and how often",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              image: Center(
                  child: Image.asset(
                'assets/prayer.png',
                fit: BoxFit.fitWidth,
              )),
            ),
            //indroduction habits
            PageViewModel(
              title: "Build Better Habits",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Make Islamic practices a part of your daily life in a way that best suits your life",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              image: Center(
                  child: Image.asset(
                'assets/zakat.png',
                fit: BoxFit.fitWidth,
              )),
            ),
          ],
          showSkipButton: true,
          skip: const Icon(Icons.skip_next),
          onDone: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ));
          },
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
          done: const Text("Done",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            //activeColor: Theme.of(context).colorScheme.secondary,
            color: Colors.purple,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
