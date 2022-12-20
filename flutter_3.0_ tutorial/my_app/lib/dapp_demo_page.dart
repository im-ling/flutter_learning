import 'package:flutter/material.dart';

int itemCount = 20;

class DappDemoPage extends StatefulWidget {
  const DappDemoPage({super.key});

  @override
  State<DappDemoPage> createState() => _DappDemoPageState();
}

// class _DappDemoPageState extends State<DappDemoPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 393.0,
//         // margin: const EdgeInsets.symmetric(vertical: 20.0),
//         height: 100.0,
//         child: ListView(
//           // This next line does the trick.
//           scrollDirection: Axis.horizontal,
//           children: <Widget>[
//             Container(
//               width: 160.0,
//               color: Colors.red,
//             ),
//             Container(
//               width: 160.0,
//               color: Colors.blue,
//             ),
//             Container(
//               width: 160.0,
//               color: Colors.green,
//             ),
//             Container(
//               width: 160.0,
//               color: Colors.yellow,
//             ),
//             Container(
//               width: 160.0,
//               color: Colors.orange,
//             ),
//           ],
//         ));
//   }
// }

// todo later
class _DappDemoPageState extends State<DappDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
            width: 393.0,
            height: 60.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                      onPressed: () {
                        debugPrint("Text button ${(index + 1)} pressed");
                      },
                      child: Text('Title ${(index + 1)}'));
                }))
      ],
    );
  }
}
