import 'package:flutter/material.dart';
import 'package:myapp_1/water_consume.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WaterConsume> waterConsumeList = [];
  final TextEditingController _noOfGlassesTEController =
      TextEditingController(text: '1');
  final TextEditingController _noteTEController =
      TextEditingController(text: 'Morning');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: const Icon(Icons.home, color: Colors.white, size: 25),
        title: const Text(
          'Water Tracker',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        actions: const [
          Icon(Icons.menu, color: Colors.white, size: 25),
          Padding(
            padding: EdgeInsets.only(right: 15),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if (_noOfGlassesTEController.text.isEmpty) {
                    _noOfGlassesTEController.text = '1';
                  }
                  final noOfGlasses = _noOfGlassesTEController.text.trim();
                  int value = int.tryParse(noOfGlasses)?? 1;
                  waterConsumeList.add(
                    WaterConsume(value, DateTime.now(), _noteTEController.text,));
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange, width: 5),
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  alignment: Alignment.center,
                  height: 150,
                  width: 150,
                  child: const Text(
                    'Tap to Add',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: _noOfGlassesTEController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 20,),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _noteTEController,
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                reverse: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(waterConsumeList[index].numOfGlasses.toString()),
                    ),
                    title: Text(
                        waterConsumeList[index].note),
                    subtitle: Text('Time: ${DateFormat.yMMMMEEEEd().format(waterConsumeList[index].time)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: (){
                        waterConsumeList.removeAt(index);
                        setState(() {});
                      },
                    )
                  );
                },
                itemCount: waterConsumeList.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
