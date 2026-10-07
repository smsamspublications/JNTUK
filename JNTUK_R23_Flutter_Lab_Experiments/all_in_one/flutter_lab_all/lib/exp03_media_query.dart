import 'package:flutter/material.dart';
void main() => runApp(const MediaQueryApp());
 
class MediaQueryApp extends StatelessWidget {
  const MediaQueryApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(home: HomePage());
}
 
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width; // current screen width
    String device;                                   // label we will choose
    Color color;
    if (width < 600) {        device = 'Mobile';  color = Colors.green;  }  // breakpoint 1
    else if (width < 1024) {  device = 'Tablet';  color = Colors.orange; }  // breakpoint 2
    else {                    device = 'Desktop'; color = Colors.blue;   }  // breakpoint 3
    return Scaffold(
      appBar: AppBar(title: const Text('MediaQuery Breakpoints')),
      body: Container(
        color: color,
        alignment: Alignment.center,
        child: Text('$device  (${width.toStringAsFixed(0)} px)',
            style: const TextStyle(fontSize: 28, color: Colors.white)),
      ),
    );
  }
}
