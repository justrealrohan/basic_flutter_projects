import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Screen', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
