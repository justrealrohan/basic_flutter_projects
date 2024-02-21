import 'package:basic_flutter_projects_1/product_llist_screen.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class crudApp extends StatefulWidget {
  const crudApp({super.key});

  @override
  State<crudApp> createState() => _crudAppState();
}

// ignore: camel_case_types
class _crudAppState extends State<crudApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const productListScreen(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintStyle: const TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600),
            labelStyle: const TextStyle(
                color: Colors.black45,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              foregroundColor: Colors.white,
              backgroundColor: Colors.amber,
              elevation: 5,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )),
    );
  }
}
