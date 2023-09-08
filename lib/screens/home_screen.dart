import 'package:flutter/material.dart';
import 'package:tic_tac_toe/UI/Theme/color.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _p1Controller = TextEditingController();
  final _p2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  'Create New Game',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Player-1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              height: 65,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: MainColor.secondaryColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.people_alt,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: _p1Controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Text('Player 1'),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Player-2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              height: 65,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: MainColor.secondaryColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.people_alt,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: _p2Controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Text('Player 2'),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => GameScreen(
                            p1: _p1Controller.text, p2: _p2Controller.text),
                      ),
                    );
                  });
                },
                child: Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple,
                        Colors.red,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade900,
                        offset: Offset(0.2, 0.8),
                        blurRadius: 2,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        'Start Game',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
