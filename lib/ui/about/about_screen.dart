import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Your logo image here
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/logo3.png'),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Noel Raffle',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MountainsofChristmas',
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                width: 200,
                child: Image.asset('assets/images/logo.png'),
              ),
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Yeni yıl, taptaze bir başlangıçtır. Geçmişi geride bırakıp yeni umutlarla dolu yarına adım atma vakti gelmiştir. İleriye umutla bakın, hayatın güzelliklerini keşfedin ve sevdiklerinizle paylaşın. Yeni yıl size mutluluk, sağlık ve başarı getirsin! 🌟 🎉',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Cairo",
                          color: Colors.white),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}