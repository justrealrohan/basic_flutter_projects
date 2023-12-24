import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp_1/dice_roller.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});


  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFFF2AFEF),
          Color(0xFF7360DF),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
    ), child: const Center (child:DiceRoller(),)
    );
  }
}
