import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tic_tac_toe/UI/Theme/color.dart';
import 'package:tic_tac_toe/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIdx = 0;

  List<Widget> _screens = [
    Scaffold(),
    HomePage(),
    Scaffold(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: _screens[selectedIdx],
      bottomNavigationBar: Container(
        height: 100,
        color: MainColor.primaryColor,
        child: GNav(
          tabBackgroundColor: MainColor.secondaryColor,
          gap: 8,
          onTabChange: (idx) {
            setState(() {
              selectedIdx = idx;
            });
          },
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              iconColor: Colors.blue.shade600,
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.gamepad,
              text: 'New Game',
              iconColor: Colors.blue.shade600,
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
              iconColor: Colors.blue.shade600,
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
