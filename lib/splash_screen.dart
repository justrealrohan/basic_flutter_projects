import 'package:flutter/material.dart';
import 'package:myapp_1/login_screen.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://th.bing.com/th/id/OIP.r0HtX7FMJKolxOsVnkW3CQHaGw?rs=1&pid=ImgDetMain',
            height: 120,
            width: 120,
          ),
          Text(
            'Tech Store'.toUpperCase(),
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Open Sans'),
          ),
          const SizedBox(height: 20),
          const CircularProgressIndicator(color: Colors.black),
        ],
      )),
    );
  }
}
