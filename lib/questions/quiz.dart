import 'package:flutter/material.dart';

import 'package:quizapp/answer.dart';
import 'package:quizapp/questions/quiz2.dart';



ButtonStyle buttonStyle = TextButton.styleFrom(
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  minimumSize: const Size(double.infinity, 50),
);

class quiz extends StatelessWidget {
  const quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Question #1: Who developed the Flutter Framework and continues to maintain it today?',
                  textAlign: TextAlign.center, // Align the text to the center
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => answer('Google'),
                      ),
                    );
                  },
                  style: buttonStyle,
                  child: const Text('A) Facebook'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Correct Answer'),
                      ),
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const quiz2()));
                  },
                  style: buttonStyle,
                  child: const Text('B) Google'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Center(
                child: TextButton(
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => answer('Google'),
                    ),
                  );},
                  style: buttonStyle,
                  child: const Text('C) Microsoft'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Center(
                child: TextButton(
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => answer('Google'),
                    ),
                  );},
                  style: buttonStyle,
                  child: const Text('D) Amazon'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
