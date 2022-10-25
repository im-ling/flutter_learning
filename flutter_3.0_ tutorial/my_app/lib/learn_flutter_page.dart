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
        actions: [
          IconButton(
              onPressed: () {
                debugPrint("Icon click");
              },
              icon: const Icon(Icons.info_outline)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(color: Colors.blue),
            Image.asset('images/ghostblade_jade.webp'),
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
                }),
            Image.network(
                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.huaban.com%2F30823db02d524d15e288e14f888db63d2ac71d791dede0-FVocP0_fw658&refer=http%3A%2F%2Fhbimg.huaban.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1669291199&t=0da46074014abd771c1e53828ae1749e"),
            Image.network(
                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.huabanimg.com%2F33c9e2585ba65798847eb7d10009db408959335030a701-VtCzeg_fw658&refer=http%3A%2F%2Fhbimg.huabanimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1669291249&t=ee66614bae722417efc5307484274388"),
          ],
        ),
      ),
    );
  }
}
