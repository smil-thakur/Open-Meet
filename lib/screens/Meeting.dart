import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:open_meet/methods/jitsi_meet_methods.dart';
import 'package:open_meet/widgets/homebutton.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final MeetMethods _meetMethods = MeetMethods();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(1000000) + 10000000).toString();
    _meetMethods.creatNewMeet(roomName: roomName);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeButton(
            onTap: createNewMeeting,
            icon: Icons.videocam,
            text: "New Meeting",
          ),
          HomeButton(
              onTap: () {
                Navigator.pushNamed(context, '/joinlobby');
              },
              icon: Icons.add_box_rounded,
              text: "Join Meeting"),
          HomeButton(
              onTap: () {}, icon: Icons.calendar_today, text: "Schedule"),
          HomeButton(
              onTap: () {},
              icon: Icons.arrow_upward_rounded,
              text: "Share Screen"),
        ],
      ),
      Expanded(
        child: Center(
          child: Text(
            'Create and Join Meeting with Just a Click!',
            style: GoogleFonts.poppins(),
          ),
        ),
      ),
    ]);
  }
}
