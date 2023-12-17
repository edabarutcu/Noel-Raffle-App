import 'package:flutter/material.dart';
import 'package:noel_raffle/ui/about/about_screen.dart';
import 'package:noel_raffle/ui/home/homepage.dart';
import 'package:noel_raffle/ui/splash/splash_screen.dart';
import 'package:noel_raffle/ui/statistics/statistics_screen.dart';
import 'package:noel_raffle/ui/success/success_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

