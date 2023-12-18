import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  late Future<Statistic> futureStatistics;

  @override
  void initState() {
    super.initState();
    futureStatistics = fetchData();
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
      body: FutureBuilder<Statistic>(
        future: futureStatistics,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.grey,
              )),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Container(
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
                                  fontFamily: 'DancingScript',
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
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Çekiliş :',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: Colors.white),
                              ),
                              Text(
                                '${snapshot.data!.totalRaffleCount}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Yılbaşı Çekilişi :',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: Colors.white),
                              ),
                              Text(
                                '${snapshot.data!.noelRaffleCount}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Hediye Çekilişi :',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: Colors.white),
                              ),
                              Text(
                                '${snapshot.data!.giftRaffleCount}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Hediye Sayısı :',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: Colors.white),
                              ),
                              Text(
                                '${snapshot.data!.giftCount}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Katılımcı Sayısı :',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: Colors.white),
                              ),
                              Text(
                                '${snapshot.data!.participantCount}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        // ... other widgets ...
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
  Future<Statistic> fetchData() async {
    final response = await http.post(Uri.parse('https://www.noelraffle.com/api/stats/'));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        print(jsonMap);
        return Statistic.fromJson(jsonMap);
      } else {
        throw Exception('Failed to load data');
      }
    }


}

class Statistic {
  final int noelRaffleCount;
  final int giftRaffleCount;
  final int participantCount;
  final int giftCount;
  final int totalRaffleCount;

  Statistic(
      {
        required this.noelRaffleCount,
        required this.giftRaffleCount,
        required this.participantCount,
        required this.giftCount,
        required this.totalRaffleCount
      });

  factory Statistic.fromJson(Map<String, dynamic> json) {
    return Statistic(
      noelRaffleCount: json['noelRaffleCount'],
      giftRaffleCount: json['giftRaffleCount'],
      participantCount: json['participantCount'],
      giftCount: json['giftCount'],
      totalRaffleCount: json['totalRaffleCount'],
    );
  }
}
