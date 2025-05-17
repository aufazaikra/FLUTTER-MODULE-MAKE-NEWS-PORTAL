import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistPage extends StatefulWidget {
  @override
  _RegistPageState createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();

  void addDataUser() async {
    if (userController.text != '' &&
        passController.text != '' &&
        pass2Controller.text != '' &&
        passController.text == pass2Controller.text) {
      var link = Uri.parse('https://e-commerce-store.glitch.me/signup');

      try {
        var response = await http.post(link, body: {
          "username": userController.text,
          "password": passController.text,
        });

        if (response.statusCode == 200) {
          _showToast("Registrasi berhasil.");
          Navigator.pop(context);
        } else {
          _showToast("Registrasi gagal. Coba lagi.");
        }
      } catch (e) {
        _showToast("Terjadi kesalahan jaringan.");
      }
    } else {
      userController.clear();
      passController.clear();
      pass2Controller.clear();
      _showToast("Pastikan semua kolom terisi dengan benar.");
    }
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 3)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Registrasi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                SizedBox(height: 20),
                TextField(controller: userController, decoration: InputDecoration(hintText: "Username")),
                TextField(controller: passController, obscureText: true, decoration: InputDecoration(hintText: "Password")),
                TextField(controller: pass2Controller, obscureText: true, decoration: InputDecoration(hintText: "Konfirmasi Password")),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Back', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: addDataUser,
                      child: Text('Sign Up', style: TextStyle(color: Colors.white)),
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
}
