import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
  }



class _DiceRollerState extends State<DiceRoller>{

  void rollDice() {
    var diceRoll = Random().nextInt(6) + 1;
    setState(() {
      activeDiceImage = 'assets/images/dice-$diceRoll.png';
    });
  }

  var activeDiceImage = 'assets/images/dice-2.png';

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),

        const SizedBox(),

        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 20, right: 20),
              backgroundColor: Colors.white),
          child: const Text(
            'Roll Dice',
            style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}