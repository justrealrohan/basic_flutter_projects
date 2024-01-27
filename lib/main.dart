import 'package:flutter/material.dart';
import 'package:myapp_1/splash_screen.dart';

void main() {
  runApp(const TechStore());
}

class TechStore extends StatelessWidget {
  const TechStore({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
    );
  }
}