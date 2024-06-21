import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(
    const DiceApp()
  );
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: const Text(
            'Dicee',
            style: TextStyle(
                color: Colors.white
            ),
          ),
          backgroundColor: Colors.green[900],
        ),
        body: const DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  dynamic leftDiceNumber = 1;
  dynamic rightDiceNumber = 1;
  dynamic total = 0;
  void rollDice(){
    leftDiceNumber = Random().nextInt(6)+1;
    rightDiceNumber = Random().nextInt(6)+1;
    total = leftDiceNumber + rightDiceNumber;
  }
  void changeDiceNum(){
    setState(() {
      rollDice();
    });
  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: Center(
                child: Text(
                    "$total",
                    style: const TextStyle(
                      fontSize: 100,
                      color: Colors.white,
                    ),
                ),
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Center(child: Text("$leftDiceNumber", style: TextStyle(fontSize: 100,color: Colors.green[900]),))
              ),
              Expanded(
                  child: Center(child: Text("$rightDiceNumber", style: TextStyle(fontSize: 100,color: Colors.green[900]),))
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: IconButton(
                    padding: const EdgeInsets.all(20),
                    icon: Image.asset('images/dice$leftDiceNumber.png'),
                    onPressed: () {
                      setState(() {
                        rollDice();
                      });
                    },

                  )
              ),
              Expanded(
                  child: IconButton(
                    padding: const EdgeInsets.all(20),
                    icon: Image.asset('images/dice$rightDiceNumber.png'),
                    onPressed: () {
                      setState(() {
                        rollDice();
                      });
                    },)
              ),
            ],
          ),
          SizedBox(
            width: 200,
            height: 80,
            child: FloatingActionButton(
              onPressed: changeDiceNum,
              tooltip: 'Roll Dice',
              backgroundColor: Colors.green[900],
              child: const Text("Roll Dice",style: TextStyle(color: Colors.white, fontSize: 26),),
            ),
          ),
        ],
      ),

    );
  }
}

