import 'package:flutter/material.dart';

class NewYearScreen extends StatelessWidget {
  final TextEditingController _sectorController = TextEditingController();
  final TextEditingController _groupController = TextEditingController();
  final TextEditingController _additionalTextFieldController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
            Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo2.png',
                    width: 300,
                    height: 250,
                  ),
                  SizedBox(height: 20),
                  _buildAdditionalTextField(),
                  SizedBox(height: 20),
                  _buildDropdownWidget(),
                  SizedBox(height: 20),
                  _buildAdditionalDropdownWidget(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 
  Widget _buildDropdownWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Color(0xFFFF6D6D),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _groupController,
              enabled: false,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Çekiliş Grubu Seçin',
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xFFFF6D6D),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
              onTap: () {},
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              items: <String>[
                'Ekip-Şirket',
                'Arkadaş-Sınıf',
                'Aile-Akraba',
                'Diğer'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                _groupController.text = value ?? '';
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalDropdownWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: Color(0xFFFF6D6D),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _sectorController,
                  enabled: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Sektör Seçin',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xFFFF6D6D),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  onTap: () {},
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: <String>[
                    'Teknoloji',
                    'Eğitim',
                    'Gıda',
                    'Sağlık',
                    'Spor',
                    'Diğer'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    _sectorController.text = value ?? '';
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
          if (_additionalTextFieldController.text.isEmpty) {
                        _showAlertDialog(context, 'Yeni bir şey ekleyiniz.');
                      } else {
                        // Yeni bir şey eklendiğinde buraya ulaşılır
                      }
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF6A84BF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            fixedSize: Size(300, 50),
          ),
          child: Text(
            'Devam',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildAdditionalTextField() {
    return Positioned(
      top: 400,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _additionalTextFieldController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Yeni bir şey ekleyin',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xFFFF6D6D),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
                onTap: () {},
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        decoration: BoxDecoration(
          color: Color(0xFFFF6D6D),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

   void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Uyarı'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}