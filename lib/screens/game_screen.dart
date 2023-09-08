import 'package:flutter/material.dart';

import '../UI/Theme/color.dart';
import '../widgets/game_logic.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
    required this.p1,
    required this.p2,
  });

  final String p1;
  final String p2;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  //variables
  String lastValue = "X";
  bool gameOver = false;
  int turn = 0;
  String result = "";
  late String player1;
  late String player2;
  List<int> scoreBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  Game game = Game();

  //Initialize board
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    game.board = Game.initGameBoard();
    // print(game.board);
    player1 = widget.p1;
    player2 = widget.p2;
  }

  String playerTurn(String val) {
    return (val == 'X') ? player1 : player2;
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            (gameOver)
                ? ''
                : "It's ${playerTurn(lastValue)} turn".toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 38,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          //Game Board
          Container(
            width: boardWidth,
            height: boardWidth,
            child: GridView.count(
              crossAxisCount: Game.boardLength ~/ 3,
              padding: const EdgeInsets.all(16.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(
                Game.boardLength,
                (index) {
                  return InkWell(
                    onTap: gameOver
                        ? null
                        : () {
                            if (game.board![index] == "") {
                              setState(() {
                                game.board![index] = lastValue;
                                turn++;
                                gameOver = game.winnerCheck(
                                    lastValue, index, scoreBoard, 3);
                                if (gameOver) {
                                  result =
                                      "${playerTurn(lastValue)} is the Winner";
                                } else if (!gameOver && turn == 9)
                                  result = "Its a Draw";
                                if (lastValue == "X")
                                  lastValue = "O";
                                else
                                  lastValue = "X";
                              });
                            }
                            //when we click new Value will be inserted
                          },
                    child: Container(
                      width: Game.blockSize,
                      height: Game.blockSize,
                      decoration: BoxDecoration(
                        color: MainColor.secondaryColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Center(
                        child: Text(
                          game.board![index],
                          style: TextStyle(
                              color: game.board![index] == "X"
                                  ? Colors.blue
                                  : Colors.pink,
                              fontSize: 64.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            result,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                game.board = Game.initGameBoard();
                lastValue = "X";
                gameOver = false;
                turn = 0;
                result = " ";
                scoreBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0];
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
                    Icons.replay,
                    size: 30,
                    color: Colors.white,
                  ),
                  Text(
                    'Play Again',
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
        ],
      ),
    );
  }
}
