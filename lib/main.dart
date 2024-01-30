import 'package:flutter/material.dart';
import 'package:myapp_1/home_screen.dart';

void main() {
  runApp(const SumApp());
}

ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
);

class SumApp extends StatelessWidget {
  const SumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
