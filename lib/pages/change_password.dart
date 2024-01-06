import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifre Değiştir'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _oldPasswordController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Eski Şifre',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _newPasswordController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Yeni Şifre',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                _changeEmailDialog(context);
              },
              child: Text('Şifreyi Değiştir'),
            ),
          ],
        ),
      ),
    );
  }

  void _changeEmailDialog(BuildContext context) {
    String oldPassword = _oldPasswordController.text;
    String newPassword = _newPasswordController.text;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: oldPassword.isNotEmpty &&
                  newPassword.isNotEmpty &&
                  oldPassword != newPassword &&
                  newPassword.isNotEmpty
              ? Colors.green[400]
              : Colors.red[400],
          title: Row(
            children: [
              oldPassword.isNotEmpty &&
                      oldPassword != newPassword &&
                      newPassword.isNotEmpty
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 30.0,
                    )
                  : Icon(
                      Icons.cancel,
                      color: Colors.white,
                      size: 30.0,
                    ),
              SizedBox(width: 8.0),
              Text(
                oldPassword.isNotEmpty &&
                        oldPassword != newPassword &&
                        newPassword.isNotEmpty
                    ? 'Harika !'
                    : 'Hay Aksi !',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
            ],
          ),
          content: Text(
            oldPassword.isNotEmpty &&
                    oldPassword != newPassword &&
                    newPassword.isNotEmpty
                ? 'Şifre başarılı bir şekilde değiştirildi.'
                : 'Şifre değiştirilirken bir hata oluştu.\nLütfen tüm alanları doldurduğunuzdan emin olun ve yeni şifrenizin eski şifrenizden farklı olduğundan emin olun',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Tamam',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
