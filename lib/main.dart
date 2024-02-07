import 'package:flutter/material.dart';
import 'package:myapp_1/home_screen.dart';

void main() {
  runApp(WaterTrackerApp());
}

class WaterTrackerApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

