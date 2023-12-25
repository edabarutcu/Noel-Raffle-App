import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io' show Platform;

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
          child: SingleChildScrollView(
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
                    const Padding(
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
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          const TabBar(
                            indicatorColor: Colors.black,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              color: Color(0xFF720303),
                            ),
                            tabs: [
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Tab(
                                  icon: Icon(
                                    Icons.phone_android,
                                    color: Colors
                                        .white, // Change this to your preferred color
                                  ),
                                  child: Text(
                                    'Mobile Developers',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Cairo",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Tab(
                                  icon: Icon(
                                    Icons.developer_mode,
                                    color: Colors
                                        .white, // Change this to your preferred color
                                  ),
                                  child: Text(
                                    'BackEnd Developers',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Cairo",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            constraints: const BoxConstraints(
                              maxHeight: 260,
                            ),
                            child: TabBarView(
                              children: [
                                Column(
                                  children: [
                                    _sortDeveloperCartByDevicePlatform(),
                                    /*_buildDeveloperCard(
                                        name: "Muhammed Elşami",
                                        title: "Android Developer",
                                        image: "https://avatars.githubusercontent.com/u/69201829?v=4",
                                        linkedInUrl: "https://www.linkedin.com/in/muhammed-elsami/",
                                        githubUrl: "https://github.com/muhammedelsami",
                                        mail: "mailto:muhammed97r@hotmail.com"),
                                    _buildDeveloperCard(
                                        name: "Eda Barutçu",
                                        title: "IOS Developer",
                                        image: "https://avatars.githubusercontent.com/u/91742636?v=4",
                                        linkedInUrl: "https://www.linkedin.com/in/eda-barutcu/",
                                        githubUrl: "https://github.com/edabarutcu",
                                        mail: "mailto:edabarutcu@protonmail.com"),*/
                                  ],
                                ),
                                Center(
                                  child: _buildDeveloperCard(
                                      name: "Kürşat Şimşek",
                                      title: "Full Stack Developer",
                                      image: "https://avatars.githubusercontent.com/u/80540635?v=4",
                                      linkedInUrl: "https://www.linkedin.com/in/kursatsmsek/",
                                      githubUrl: "https://github.com/kursatsmsek",
                                      mail: "mailto:kursatsimsek@protonmail.ch"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeveloperCard(
      {required String name,
      required String title,
      required String image,
      required String linkedInUrl,
      required String githubUrl,
      required String mail}) {
    return Card(
      color: Colors.red,
      elevation: 5,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 6, top: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 117,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(image, height: 70, width: 70, fit: BoxFit.cover),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Cairo",
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Cairo",
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
                        onPressed: () async {
                          if (await canLaunch(linkedInUrl)) {
                            await launch(linkedInUrl);
                          } else {
                            throw 'Could not launch $linkedInUrl';
                          }
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white),
                        onPressed: () async {
                          if (await canLaunch(githubUrl)) {
                            await launch(githubUrl);
                          } else {
                            throw 'Could not launch $githubUrl';
                          }
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.at, color: Colors.white),
                        onPressed: () async {
                          if (await canLaunch(mail)) {
                            await launch(mail);
                          } else {
                            throw 'Could not launch $mail';
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sortDeveloperCartByDevicePlatform() {
    if (Platform.isAndroid) {
      return Column(
        children: [
          _buildDeveloperCard(
            name: "Muhammed Elşami",
            title: "Android Developer",
            image: "https://avatars.githubusercontent.com/u/69201829?v=4",
            linkedInUrl: "https://www.linkedin.com/in/muhammed-elsami/",
            githubUrl: "https://github.com/muhammedelsami",
            mail: "mailto:muhammed97r@hotmail.com",
          ),
          _buildDeveloperCard(
            name: "Eda Barutçu",
            title: "IOS Developer",
            image: "https://avatars.githubusercontent.com/u/91742636?v=4",
            linkedInUrl: "https://www.linkedin.com/in/eda-barutcu/",
            githubUrl: "https://github.com/edabarutcu",
            mail: "mailto:edabarutcu@protonmail.com",
          ),
        ],
      );
    } else if (Platform.isIOS) {
      return Column(
        children: [
          _buildDeveloperCard(
            name: "Eda Barutçu",
            title: "IOS Developer",
            image: "https://avatars.githubusercontent.com/u/91742636?v=4",
            linkedInUrl: "https://www.linkedin.com/in/eda-barutcu/",
            githubUrl: "https://github.com/edabarutcu",
            mail: "mailto:edabarutcu@protonmail.com",
          ),
          _buildDeveloperCard(
            name: "Muhammed Elşami",
            title: "Android Developer",
            image: "https://avatars.githubusercontent.com/u/69201829?v=4",
            linkedInUrl: "https://www.linkedin.com/in/muhammed-elsami/",
            githubUrl: "https://github.com/muhammedelsami",
            mail: "mailto:muhammed97r@hotmail.com",
          ),
        ],
      );
    }
    return Column();
  }
}
