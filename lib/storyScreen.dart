import 'package:flutter/material.dart';

class AudioSreen extends StatefulWidget {
  const AudioSreen({super.key});

  @override
  State<AudioSreen> createState() => _AudioSreenState();
}

class _AudioSreenState extends State<AudioSreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text('Audio'),
      ),
    ));
  }
}
