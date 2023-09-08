import 'package:flutter/material.dart';
import 'package:tic_tac_toe/UI/Theme/color.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';
import 'package:tic_tac_toe/screens/home_screen.dart';
import 'package:tic_tac_toe/screens/main_screen.dart';
import 'package:tic_tac_toe/widgets/game_logic.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
