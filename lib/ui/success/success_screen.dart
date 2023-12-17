import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/services.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    _confettiController = ConfettiController(duration: Duration(seconds: 2));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.red,
        systemNavigationBarDividerColor: Colors.red,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
               image: DecorationImage(
                 image: AssetImage('assets/images/background.jpg'),
                 fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'), // replace with your logo
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'Çekiliş başarıyla tamamlandı.\n Lütfen e-postalarınızı kontrol ediniz.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Cairo', height: 1.5, letterSpacing: 1.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                blastDirection: pi/2, // radial value - LEFT
                maxBlastForce: 5, // set a lower number for slow explosions
                minBlastForce: 2, // set a higher number for faster explosions
                emissionFrequency: 0.2, // how often it should emit
                numberOfParticles: 30, // number of particles to emit
                gravity: 0.005, // gravity - or how fast they should fall// start again as soon as the animation is finished
              ),
            ),
          ),
        ],
      ),
    );
  }
}