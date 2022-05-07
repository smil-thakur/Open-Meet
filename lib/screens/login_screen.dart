import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_meet/methods/auth_methods.dart';
import 'package:open_meet/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  bool res = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Flexible(
            child: Container(),
            flex: 1,
          ),
          Text(
            "Start or Join A meet",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Container(),
            flex: 1,
          ),
          Image.asset("assets/images/onboarding.jpg"),
          Flexible(
            child: Container(),
            flex: 1,
          ),
          InkWell(
            onTap: () async {
              res = await _authMethods.signInWithGoogle(context);
              if (res) {
                Navigator.pushNamed(context, '/home');
              }
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "login in",
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(),
            flex: 1,
          ),
        ]),
      ),
    );
  }
}
