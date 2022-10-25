import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Flutter"),
        automaticallyImplyLeading: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Column(
        children: [
          const Divider(color: Colors.blue),
          Image.asset('images/einstein.jpg'),
          const SizedBox(height: 10),
          const Divider(color: Colors.blue),
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            color: Colors.blueGrey,
            width: double.infinity,
            child: const Center(
              child: Text(
                "This is a text widget",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      isSwitch ? Colors.green : Colors.blueGrey)),
              onPressed: () {
                debugPrint("Elevated button pressed");
              },
              child: const Text("Elevated Button")),
          OutlinedButton(
              onPressed: () {
                debugPrint("Outlined button pressed");
              },
              child: const Text("Outlined Button")),
          TextButton(
              onPressed: () {
                debugPrint("Text button pressed");
              },
              child: const Text("Text Button")),
          GestureDetector(
            onTap: () {
              debugPrint("tap row");
            },
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.local_fire_department,
                  color: Colors.blue,
                ),
                Text("Row Button"),
                Icon(
                  Icons.local_fire_department,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Switch(
              value: isSwitch,
              onChanged: ((bool newValue) {
                setState(() {
                  isSwitch = newValue;
                });
              })),
          Checkbox(
              value: isChecked,
              onChanged: (bool? newValue) {
                setState(() {
                  isChecked = newValue;
                });
              })
        ],
      ),
    );
  }
}
