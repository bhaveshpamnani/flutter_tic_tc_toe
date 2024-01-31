import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/screens/game.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();

}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GameScreen(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor.primaryColor,
        body: Center(
          child: Text(
            'Tic-Tac-Toe Game',
            style:
            TextStyle(
              fontFamily: 'googleFont',
              color: Colors.white,
              fontSize: 28,
              letterSpacing: 3,
            ),
          ),
        )
    );
  }
}
