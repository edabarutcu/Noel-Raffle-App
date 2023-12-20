import 'package:flutter/material.dart';

class NewUsersScreen extends StatefulWidget {
  const NewUsersScreen({Key? key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<NewUsersScreen> {
  final TextEditingController _searchController = TextEditingController();
  final _users = <User>[];

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();

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
        body: Column(
          children: [
            Image.asset(
              'assets/images/logo2.png',
              width: 300,
              height: 250,
            ),
            SizedBox(height: 20),
            _addUserButton(),
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text('${user.name} ${user.surname}',
                          style: const TextStyle(
                              color: Colors.white, fontFamily: "Cairo")),
                      subtitle: Text(user.email,
                          style: const TextStyle(
                              color: Colors.white, fontFamily: "Cairo")),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _users.removeAt(index);
                          });
                        },
                      ),
                      onTap: () {
                        _nameController.text = user.name;
                        _surnameController.text = user.surname;
                        _emailController.text = user.email;
                        showDialog(
                          context: context,
                          builder: (context) =>
                              _buildDialog(context, onSave: () {
                            setState(() {
                              user.name = _nameController.text;
                              user.surname = _surnameController.text;
                              user.email = _emailController.text;
                            });
                          }),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: _users.length >= 3
                          ? () {
                              // Navigate to the next screen
                            }
                          : () => showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Uyarı',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "Cairo", fontSize: 20)),
                                  content: const Text(
                                      'En az 3 kişi eklemelisiniz!',
                                      style: TextStyle(
                                          fontFamily: "Cairo", fontSize: 20)),
                                  actions: [
                                    Center(
                                      child: TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: const Text(
                                            'Tamam',
                                            style: TextStyle(
                                                fontFamily: "Cairo",
                                                fontSize: 20),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                      child: const Text('Devam Et',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "Cairo")),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addUserButton() {
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
                _surnameController.clear();
                _emailController.clear();
                showDialog(
                  context: context,
                  builder: (context) => _buildDialog(context, onSave: () {
                    setState(() {
                      _users.add(User(
                        name: _nameController.text,
                        surname: _surnameController.text,
                        email: _emailController.text,
                      ));
                    });
                  }),
                );
              },
              child: const Text('Yeni Katılımcı Ekle',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: "Cairo")),
            ),
          ),
        ],
      ),
    );
  }

Widget _buildDialog(BuildContext context, {required VoidCallback onSave}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Scaffold(
      backgroundColor: Colors.transparent, 
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xE6D9D9D9), 
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Yeni Katılımcı',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(labelText: 'Ad'),
                      ),
                      TextField(
                        controller: _surnameController,
                        decoration: InputDecoration(labelText: 'Soyad'),
                      ),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6A84BF)),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 18)),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 110, vertical: 15)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: Text('Ekle'),
                          onPressed: () {
                            onSave();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


  Widget _buildTextField(TextEditingController emailController, String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
              onTap: () {},
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class User {
  String name;
  String surname;
  String email;

  User({required this.name, required this.surname, required this.email});
}
