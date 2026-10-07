import 'package:flutter/material.dart';
void main() => runApp(const ResponsiveApp());
 
class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Responsive UI')),
        body: LayoutBuilder(                 // gives us the available width & height
          builder: (context, constraints) {  // constraints.maxWidth = current width
            if (constraints.maxWidth < 600) { // narrow -> phone
              return Column(children: _boxes());          // stack vertically
            } else {                          // wide -> tablet / desktop
              return Row(                     // spread horizontally
                children: _boxes()
                    .map((w) => Expanded(child: w)).toList());
            }
          },
        ),
      ),
    );
  }
 
  // Three coloured boxes we reuse in both layouts.
  List<Widget> _boxes() => [
    Container(height: 100, color: Colors.red,   margin: const EdgeInsets.all(8)),
    Container(height: 100, color: Colors.green, margin: const EdgeInsets.all(8)),
    Container(height: 100, color: Colors.blue,  margin: const EdgeInsets.all(8)),
  ];
}
