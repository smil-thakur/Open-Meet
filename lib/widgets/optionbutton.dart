import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_meet/utils/colors.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final bool ismute;
  final Function(bool) onchange;

  const OptionButton({
    Key? key,
    required this.text,
    required this.ismute,
    required this.onchange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(fontSize: 15),
            ),
            Switch(
              value: ismute,
              onChanged: onchange,
            ),
          ],
        ),
      ),
    );
  }
}
