import 'package:flutter/material.dart';

import 'package:quizapp/answer.dart';

ButtonStyle buttonStyle = TextButton.styleFrom(
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  minimumSize: const Size(double.infinity, 50),
);

class quiz5 extends StatelessWidget {
  const quiz5({super.key});

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
                  'Question #5: A sequence of asynchronous Flutter events is known as a:',
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
                            builder: (context) => answer('Stream')));
                  },
                  style: buttonStyle,
                  child: const Text('A) Future'),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => quiz5()));
                  },
                  style: buttonStyle,
                  child: const Text('B) Stream'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => answer('Stream'),
                      ),
                    );
                  },
                  style: buttonStyle,
                  child: const Text('C) Promise'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => answer('Stream'),
                      ),
                    );
                  },
                  style: buttonStyle,
                  child: const Text('D) Channel'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
