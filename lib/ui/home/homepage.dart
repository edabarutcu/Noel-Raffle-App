import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset(
                'assets/images/logo3.png',
                width: 108, 
                height: 90,
              ),
            ),
         Positioned(
  right: 0,
  top: 0,
  child: Transform.scale(
    scale: 0.7, // Küçültme faktörü, 1 tam boyut demektir, 0.5 yarı boyut demektir
    child: Image.asset(
      'assets/images/Vector.png',
      width: 50,
      height: 90,
    ),
  ),
),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/gift-raffle.png',
                    width: 190,
                    height: 190,
                  ),
                  SizedBox(height: 20), 
                  Text(
                    'Hediye Çekilişi',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "MountainsofChristmas",
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10), 
                  Text(
                    'Çekiliş türü seçiniz',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "MountainsofChristmas",
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                    
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFEE1919), 
                       shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                       minimumSize: Size(270, 60), // Butonun minimum boyutunu belirler
                    ),
                    child: Text('Yılbaşı Çekilişi'
                    ,style: TextStyle(fontFamily: "MountainsofChristmas", color: Colors.white, fontSize: 25),),

                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                    
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFEE1919), 
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), 
                      

                      ), 
                                            minimumSize: Size(270, 60), // Butonun minimum boyutunu belirler

                      
                    ),
                    
                   child: Text('Hediye Çekilişi'
                    ,style: TextStyle(fontFamily: "MountainsofChristmas", color: Colors.white, fontSize: 25),),

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}







