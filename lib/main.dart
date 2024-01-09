import 'package:flutter/material.dart';

import 'gradient_container.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Dice App',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5),
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: const GradientContainer(),
    ),
  ));
}