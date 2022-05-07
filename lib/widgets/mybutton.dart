import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_meet/utils/colors.dart';

class Mybutton extends StatelessWidget {
  final String text;
  const Mybutton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          text,
          style: GoogleFonts.poppins(),
        ),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: buttonColor),
          ),
        ),
      ),
    );
  }
}
