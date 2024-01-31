import 'package:flutter/material.dart';
import '../constants/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String turn = 'Turn of O';
  bool oTurn = true;
  bool isInp = false;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  String resultDeclaration = '';
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  bool winnerFound = false;
  int attempts = 0;
  List<int> matchedIndexes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor.primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/images/boy.png'),
                                      radius: 30,
                                    ),
                                    Text(
                                      'Player O',
                                      style: TextStyle(
                                        fontFamily: 'googleFont',
                                        color: MainColor.secondaryColor,
                                      ),
                                    ),
                                    Text(
                                      oScore.toString(),
                                      style: TextStyle(
                                        fontFamily: 'googleFont',
                                        color: MainColor.secondaryColor,
                                      ),
                                    )
                                  ],
                                ),
                                width: 55,
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/images/man.png'),
                                      radius: 30,
                                    ),
                                    Text(
                                      'Player X',
                                      style: TextStyle(
                                        fontFamily: 'googleFont',
                                        color: MainColor.secondaryColor,
                                      ),
                                    ),
                                    Text(
                                      xScore.toString(),
                                      style: TextStyle(
                                        fontFamily: 'googleFont',
                                        color: MainColor.secondaryColor,
                                      ),
                                    )
                                  ],
                                ),
                                width: 55,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              Expanded(
                  flex: 4,
                  child: GridView.builder(
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return  GestureDetector(
                          onTap: () {
                            _tapped(index);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 5,
                                color: MainColor.primaryColor,
                              ),
                              color: matchedIndexes.contains(index) ? MainColor.accentColor:MainColor.secondaryColor,
                            ),
                            child: Center(
                              child:  Text(displayXO[index] ,
                                  style: TextStyle(
                                      fontFamily: 'googleFont',
                                      color: Colors.black,
                                      fontSize: 55) ),
                            ),
                          ),
                        );
                      })),
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        winnerFound?resultDeclaration:turn,
                        style: TextStyle(
                            fontFamily: 'googleFont',
                            color: Colors.white,
                            fontSize: 25),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(style:ElevatedButton.styleFrom(
                        backgroundColor: MainColor.accentColor,
                        padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16)
                      ) ,
                          onPressed: (){
                        _clearBoard();
                        isInp = true;
                        attempts++;
                          },
                          child: Text(
                              attempts == 0 ? 'Start':'Play Again!',style: TextStyle(
                            fontFamily: 'googleFont',
                            color: Colors.black,
                          fontSize: 18)))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _tapped(int index) {
    setState(() {
      if(isInp) {
        if (oTurn && displayXO[index] == '') {
          displayXO[index] = 'O';
          filledBoxes++;
          turn = 'Turn of X';
        } else if (!oTurn && displayXO[index] == '') {
          displayXO[index] = 'X';
          filledBoxes++;
          turn = 'Turn of O';

        }
        oTurn = !oTurn;
        _checkWinner();
      }
      else{
        print('restart');
      }
    });
  }

  void _checkWinner() {
    //check 1st Row

    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins';
        _updateScore(displayXO[0]);
        matchedIndexes.addAll([0,1,2]);

      });
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[3] + ' Wins';
        _updateScore(displayXO[3]);
        matchedIndexes.addAll([3,4,5]);

      });
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[6] + ' Wins';
        _updateScore(displayXO[6]);
        matchedIndexes.addAll([6,7,8]);
      });
    }
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins';
        _updateScore(displayXO[0]);
        matchedIndexes.addAll([0,3,6]);
      });
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[1] + ' Wins';
        _updateScore(displayXO[1]);
        matchedIndexes.addAll([1,4,7]);
      });
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[2] + ' Wins';
        _updateScore(displayXO[2]);
        matchedIndexes.addAll([2,5,8]);
      });
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' Wins';
        _updateScore(displayXO[0]);
        matchedIndexes.addAll([0,4,8]);

      });
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[2] + ' Wins';
        _updateScore(displayXO[2]);
        matchedIndexes.addAll([2,4,6]);
      });
    }
     if (!winnerFound &&  filledBoxes == 9){
      resultDeclaration = 'Nobody Wins!';
    }
  }
  void _updateScore(String winner){
    if(winner == 'O'){
      oScore++;
    }
    else if(winner == 'X'){
      xScore++;
    }
    winnerFound = true;
    isInp = false;
  }
  void _clearBoard(){
    setState(() {
      for(int i = 0;i<9;i++){
        displayXO[i]='';
      }
      resultDeclaration='';
    });
    filledBoxes = 0;
    winnerFound = false;
    matchedIndexes =[];
  }
}
