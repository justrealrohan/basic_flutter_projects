import 'package:flutter/material.dart';
import 'package:myapp_1/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final TextEditingController _numOneTEController = TextEditingController();
final TextEditingController _numTwoTEController = TextEditingController();
GlobalKey<FormState> _formKey = GlobalKey<FormState>();
double _result = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const Icon(
          Icons.home,
          size: 28,
          color: Colors.white,
        ),
        title: const Text(
          'Home',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: const [
          Icon(Icons.menu, size: 28, color: Colors.white),
          Padding(padding: EdgeInsets.only(right: 15)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _numOneTEController,
                validator: (String? value) {
                  String v = value ?? '0';
                  if (v.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Input Number One',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _numTwoTEController,
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  String v = value ?? '0';
                  if (v.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: 'Input Number Two', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          double numOne = double.tryParse(
                                _numOneTEController.text.trim(),
                              ) ??
                              0;
                          double numTwo = double.tryParse(
                                _numTwoTEController.text.trim(),
                              ) ??
                              0;
                          _result = numOne + numTwo;
                          setState(() {});
                        }
                      },
                      style: buttonStyle,
                      child: const Text('add'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          double numOne = double.tryParse(
                                _numOneTEController.text.trim(),
                              ) ??
                              0;
                          double numTwo = double.tryParse(
                                _numTwoTEController.text.trim(),
                              ) ??
                              0;
                          _result = numOne - numTwo;
                          setState(() {});
                        }
                      },
                      style: buttonStyle,
                      child: const Text('sub'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        clear();
                        setState(() {});
                      },
                      style: buttonStyle,
                      child: const Text('clear'),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Result is $_result',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double add(double numOne, double numTwo) {
  return numOne + numTwo;
}

double sub(numOne, numTwo) {
  return numOne - numTwo;
}

void clear() {
  _numOneTEController.clear();
  _numTwoTEController.clear();
  _result = 0;
}
