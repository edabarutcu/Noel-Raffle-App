import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noel_raffle/ui/giftraffle/add_users_screen.dart';
import 'package:noel_raffle/ui/success/success_screen.dart';

class GiftsScreen extends StatefulWidget {
  final List<User> users;
  final String title;

  const GiftsScreen({Key? key, required this.users, required this.title})
      : super(key: key);

  @override
  _GiftsScreenState createState() => _GiftsScreenState();
}

class _GiftsScreenState extends State<GiftsScreen> {
  final _gifts = <Gift>[];

  final _nameController = TextEditingController();
  final _countController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _countFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          // Your background image here
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/images/gift-hand.png',
                  width: 300,
                  height: 250,
                ),
                _addGiftButton(),
                _buildListView(width, height),
                _buildSaveButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _addGiftButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                _nameController.clear();
                _countController.clear();

                showDialog(
                  context: context,
                  builder: (context) => _buildDialog(context, onSave: () {
                    setState(() {
                      _gifts.add(Gift(
                        name: _nameController.text,
                        count: _countController.text,
                      ));
                    });
                  }),
                );
              },
              child: const Text('Yeni Hediye Ekle',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: "Cairo")),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialog(BuildContext context, {required VoidCallback onSave}) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: const Text('Yeni Hediye Ekle',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Cairo", fontSize: 20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'İsim'),
              ),
              TextField(
                controller: _countController,
                decoration: InputDecoration(labelText: 'Sayı'),
              ),
              // _buildTextField(_emailController, 'Email')
            ],
          ),
          actions: [
            TextButton(
              child: Text('Kaydet'),
              onPressed: () {
                if (_nameController.text.isEmpty ||
                    _countController.text.isEmpty) {
                  // Show an error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tüm alanlar zorunludur')),
                  );
                } else {
                  onSave();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.4,
      child: ListView.builder(
        itemCount: _gifts.length,
        itemBuilder: (context, index) {
          final user = _gifts[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text('${user.name}',
                  style: const TextStyle(
                      color: Colors.white, fontFamily: "Cairo")),
              subtitle: Text(user.count,
                  style: const TextStyle(
                      color: Colors.white, fontFamily: "Cairo")),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _gifts.removeAt(index);
                  });
                },
              ),
              onTap: () {
                _nameController.text = user.name;
                _countController.text = user.count;
                showDialog(
                  context: context,
                  builder: (context) => _buildDialog(context, onSave: () {
                    setState(() {
                      user.name = _nameController.text;
                      user.count = _countController.text;
                    });
                  }),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              onPressed: _gifts.length >= 3
                  ? () async {
                      var a = sendPostRequest();
                      print('ddddd ==  ${a} ');
                    }
                  : () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Uyarı',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontFamily: "Cairo", fontSize: 20)),
                          content: const Text('En az 3 Hediye eklemelisiniz!',
                              style:
                                  TextStyle(fontFamily: "Cairo", fontSize: 20)),
                          actions: [
                            Center(
                              child: TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text(
                                    'Tamam',
                                    style: TextStyle(
                                        fontFamily: "Cairo", fontSize: 20),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ],
                        ),
                      ),
              child: const Text('Çekilişi Başlat',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: "Cairo")),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> sendPostRequest() async {
    var url = Uri.parse('https://www.noelraffle.com/api/gift/raffle');

    List<Map<String, dynamic>> participants = widget.users
        .map((user) =>
            {"name": user.name, "surname": user.surname, "email": user.email})
        .toList();

    List<Map<String, dynamic>> gifts = _gifts
        .map((gift) => {
              "giftId": "1bc4a4af-134b-448d-afcb-162fadffb170",
              // replace with actual giftId
              "name": gift.name,
              "count": int.parse(gift.count)
            })
        .toList();

    var body = {
      "title": widget.title,
      "group": 10,
      "sector": 10,
      "participants": participants,
      "gifts": gifts
    };

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json", "Accept-Language": "tr"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print('Success!');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SuccessScreen()));
      return true;
    } else {
      print('Failed to send post request. Status code: ${response.statusCode}');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Uyarı',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: "Cairo", fontSize: 20)),
          content: const Text('Bir hata oluştu. Lütfen tekrar deneyiniz.',
              style: TextStyle(fontFamily: "Cairo", fontSize: 20)),
          actions: [
            Center(
              child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Tamam',
                    style: TextStyle(fontFamily: "Cairo", fontSize: 20),
                    textAlign: TextAlign.center,
                  )),
            ),
          ],
        ),
      );
      return false;
    }
  }
}

class Gift {
  String name;
  String count;

  Gift({required this.name, required this.count});
}
