import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeEmailPage extends StatefulWidget {
  @override
  _ChangeEmailPageState createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  TextEditingController _oldEmailController = TextEditingController();
  TextEditingController _newEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-posta Değiştir'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _oldEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Eski E-posta',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _newEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Yeni E-posta',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                _changeEmailDialog(context);
              },
              child: Text('E-postayı Değiştir'),
            ),
          ],
        ),
      ),
    );
  }

  void _changeEmailDialog(BuildContext context) {
    String oldMail = _oldEmailController.text;
    String newMail = _newEmailController.text;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor:
              oldMail != newMail && newMail.isNotEmpty && oldMail.isNotEmpty
                  ? Colors.green[400]
                  : Colors.red[400],
          title: Row(
            children: [
              oldMail != newMail && newMail.isNotEmpty && oldMail.isNotEmpty
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
                oldMail != newMail && newMail.isNotEmpty && oldMail.isNotEmpty
                    ? 'Harika !'
                    : 'Hay Aksi !',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
            ],
          ),
          content: Text(
            oldMail != newMail && newMail.isNotEmpty && oldMail.isNotEmpty
                ? 'E-mail başarılı bir şekilde değiştirildi.'
                : 'E-mail değiştirilirken bir hata oluştu.\nLütfen tüm alanları doldurduğunuzdan emin olun.',
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
              child: Text(
                'Tamam',
                style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
              ),
            ),
          ],
        );
      },
    );
  }
}
