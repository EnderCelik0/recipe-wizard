import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
            textInputAction: TextInputAction.next,
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintStyle:
                  TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: label,
              labelStyle:
                  TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
            )),
        SizedBox(height: 10)
      ],
    );
  }
}
