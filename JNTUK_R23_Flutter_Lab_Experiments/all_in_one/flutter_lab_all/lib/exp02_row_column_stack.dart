import 'package:flutter/material.dart';
void main() => runApp(const LayoutDemo());
 
class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Row, Column & Stack')),
        body: Column(                       // outer Column = the three demos stacked
          children: [
            Row(                             // Row places children left-to-right
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // equal gaps
              children: const [
                Icon(Icons.home, size: 40),
                Icon(Icons.star, size: 40),
                Icon(Icons.settings, size: 40),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(                        // fill the leftover vertical space
              child: Stack(                  // Stack layers children on top of each other
                alignment: Alignment.center, // centre every layer
                children: [
                  Container(width: 200, height: 200, color: Colors.blue),  // bottom
                  Container(width: 130, height: 130, color: Colors.orange),// middle
                  const Text('On Top',       // top layer
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
