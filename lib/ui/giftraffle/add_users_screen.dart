import 'package:flutter/material.dart';
import 'package:noel_raffle/ui/giftraffle/add_gift_screen.dart';

class UsersScreen extends StatefulWidget {
  final String title;
  const UsersScreen({Key? key, required this.title}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final TextEditingController _searchController = TextEditingController();
  final _users = <User>[];

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();

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
                _addUserButton(),
                _buildListView(width, height),
                _buildssssss()
              ],
            ),
          ),
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
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: const Text('Yeni Katılımcı Ekle',
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
                controller: _surnameController,
                decoration: InputDecoration(labelText: 'Soyisim'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              // _buildTextField(_emailController, 'Email')
            ],
          ),
          actions: [
            TextButton(
              child: Text('Kaydet'),
              onPressed: () {
                String email = _emailController.text;
                String p = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                RegExp regExp = new RegExp(p);

                if (_nameController.text.isEmpty ||
                    _surnameController.text.isEmpty ||
                    email.isEmpty ||
                    !regExp.hasMatch(email)) {
                  // Show an error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tüm alanlar zorunludur ve e-posta geçerli olmalıdır!')),
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

  Widget _buildTextField(TextEditingController emailController, String label) {
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

  Widget _buildListView(double width, double height) {
    return SizedBox(
      width: width,
      height: height * 0.4,
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
    );
  }

  Widget _buildssssss() {
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
              onPressed: _users.length >= 3
                  ? () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GiftsScreen(users: _users, title: widget.title)));
              } : () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Uyarı',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: "Cairo", fontSize: 20)),
                  content: const Text(
                      'En az 3 kişi eklemelisiniz!', style: TextStyle(fontFamily: "Cairo", fontSize: 20)),
                  actions: [
                    Center(
                      child: TextButton(
                          onPressed: () =>
                              Navigator.of(context).pop(),
                          child: const Text('Tamam',
                            style: TextStyle(fontFamily: "Cairo", fontSize: 20), textAlign: TextAlign.center,)
                      ),
                    ),
                  ],
                ),
              ),
              child: const Text('Devam Et',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: "Cairo")),
            ),
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
