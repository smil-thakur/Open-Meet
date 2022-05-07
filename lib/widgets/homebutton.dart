import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_meet/utils/colors.dart';

class HomeButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String text;
  const HomeButton(
      {Key? key, required this.onTap, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onTap,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(color: Colors.grey),
        ),
      ]),
    );
  }
}
