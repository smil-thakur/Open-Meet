import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_meet/methods/auth_methods.dart';
import 'package:open_meet/methods/jitsi_meet_methods.dart';
import 'package:open_meet/utils/colors.dart';
import 'package:open_meet/utils/utils.dart';
import 'package:open_meet/widgets/optionbutton.dart';

class JoinLobby extends StatefulWidget {
  const JoinLobby({Key? key}) : super(key: key);

  @override
  State<JoinLobby> createState() => _JoinLobbyState();
}

class _JoinLobbyState extends State<JoinLobby> {
  final AuthMethods _authMethods = AuthMethods();
  final MeetMethods _meetMethods = MeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  late TextEditingController _RoomID;
  late TextEditingController _namecontroller;

  @override
  void initState() {
    // TODO: implement initState
    _RoomID = TextEditingController();
    _namecontroller =
        TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _RoomID.dispose();
    _namecontroller.dispose();
  }

  _joinMeet() {
    if (_RoomID.text.isEmpty) {
      showSnackBar(context, "Enter Room Code");
    } else {
      _meetMethods.creatNewMeet(
        roomName: _RoomID.text,
        isAudioMuted: isAudioMuted,
        video: isVideoMuted,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Join Meet",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            TextField(
              controller: _RoomID,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room ID'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _namecontroller,
              maxLines: 1,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name'),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: _joinMeet,
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "Join Meeting",
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            OptionButton(
              text: "Audio Muted",
              ismute: isAudioMuted,
              onchange: onAudioMuted,
            ),
            const SizedBox(
              height: 10,
            ),
            OptionButton(
              text: "Video Off",
              ismute: isVideoMuted,
              onchange: onVideoMuted,
            ),
          ],
        ),
      ),
    );
  }

  onAudioMuted(bool? val) {
    setState(() {
      isAudioMuted = val!;
    });
  }

  onVideoMuted(bool? val) {
    setState(() {
      isVideoMuted = val!;
    });
  }
}
