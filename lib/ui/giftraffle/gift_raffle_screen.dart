import 'package:flutter/material.dart';
import 'package:noel_raffle/ui/about/about_screen.dart';
import 'add_users_screen.dart';

class GiftRaffleScreen extends StatefulWidget {
  const GiftRaffleScreen({super.key});

  @override
  _GiftRaffleScreenState createState() => _GiftRaffleScreenState();
}

class _GiftRaffleScreenState extends State<GiftRaffleScreen> {
  final TextEditingController _additionalTextFieldController = TextEditingController();
  String? _groupController;
  String? _sectorController;

  int _groupValue = 100;
  int _sectorValue = 100;

  var typeList = <String, int> {
    'Ekip-Şirket': 10,
    'Arkadaş-Sınıf': 20,
    'Aile-Akraba': 30,
    'Diğer': 40
  };

  var sectorList = <String, int> {
    'Teknoloji': 10,
    'Eğitim': 20,
    'Gıda': 30,
    'Sağlık': 40,
    'Spor': 50,
    'Diğer': 60
  };

  @override
  Widget build(BuildContext context) {
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
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/gift-hand.png',
                      width: 300,
                      height: 250,
                    ),
                    const SizedBox(height: 20),
                    _buildAdditionalTextField(),
                    const SizedBox(height: 20),
                    _customDropdownButton1(),
                    const SizedBox(height: 20),
                    _customDropdownButton2(),
                    const SizedBox(height: 20),
                    _buildButtonWidget(context),
              
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10),
      child: Positioned(
        top: 400,
        left: 0,
        right: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: const Color(0xFFFF6D6D),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _additionalTextFieldController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Çekiliş Başlığı Giriniz*',
                    hintStyle: TextStyle(color: Color(0xFFCCCCCC), fontFamily: "Cairo", fontSize: 20),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xFFFF6D6D),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customDropdownButton1() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFF6D6D),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _groupController,
                  dropdownColor: Color(0xFFFF6D6D),
                  icon: Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 20,
                      color: Colors.white
                  ),
                  hint: const Text(
                      'Çekiliş Tipi Seçin',
                      style: TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 20,
                          color: Color(0xFFCCCCCC)
                      )
                  ),
                  items: typeList.keys.toList().map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _groupController = value!;
                      _groupValue = typeList[value]!;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customDropdownButton2() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFF6D6D),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _sectorController,
                  dropdownColor: Color(0xFFFF6D6D),
                  icon: Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 20,
                      color: Colors.white
                  ),
                  hint: const Text(
                      'Çekiliş Tipi Seçin',
                      style: TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 20,
                          color: Color(0xFFCCCCCC)
                      )
                  ),
                  items: sectorList.keys.toList().map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _sectorController = value!;
                      _sectorValue = sectorList[value]!;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                if (_additionalTextFieldController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Uyarı', textAlign: TextAlign.center ,style: TextStyle(fontFamily: "Cairo", fontSize: 20)),
                      content: const Text('Lütfen çekiliş başlığını giriniz.', style: TextStyle(fontFamily: "Cairo", fontSize: 20)),
                      actions: [
                        Center(
                          child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Tamam', style: TextStyle(fontFamily: "Cairo", fontSize: 20),textAlign: TextAlign.center,),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UsersScreen(title: _additionalTextFieldController.text, groupValue: _groupValue, sectorValue: _sectorValue)),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A84BF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(270, 60),
              ),
              child: const Text(
                'Hediye Çekilişi Oluştur',
                style: TextStyle(
                    fontFamily: "Cairo",
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
