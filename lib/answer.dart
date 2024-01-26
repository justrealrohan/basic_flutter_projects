import 'package:flutter/material.dart';
import 'package:quizapp/questions/quiz2.dart';

class answer extends StatelessWidget {
  String msg;

  answer(this.msg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Quiz'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.blue, Colors.purple],)

        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Wrong Answer!',
                  style: TextStyle(
                      color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Correct Answer is: $msg!',
                  style: const TextStyle(
                      color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20,),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const quiz2()));
              }, icon: const Icon(Icons.arrow_forward, size: 35, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
