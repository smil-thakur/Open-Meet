import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_meet/methods/auth_methods.dart';
import 'package:open_meet/screens/Meeting.dart';
import 'package:open_meet/screens/history.dart';
import 'package:open_meet/utils/colors.dart';
import 'package:open_meet/widgets/homebutton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryScreen(),
    const Text('contacts'),
    Center(
      child: InkWell(
        onTap: () => AuthMethods().signOut(),
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              "log Out",
              style: GoogleFonts.poppins(),
            ),
          ),
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Meet and Chat",
            style: GoogleFonts.poppins(),
          )),
      body: pages[_page],
      bottomNavigationBar: Container(
        color: footerColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BottomNavigationBar(
              backgroundColor: footerColor,
              elevation: 0,
              selectedItemColor: Colors.white,
              onTap: onPageChanged,
              currentIndex: _page,
              type: BottomNavigationBarType.fixed,
              unselectedFontSize: 14,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.comment_bank),
                  label: 'Meet & Char',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.lock_clock),
                  label: 'Meetings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.contacts),
                  label: 'Contacts',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
              ]),
        ),
      ),
    );
  }
}
