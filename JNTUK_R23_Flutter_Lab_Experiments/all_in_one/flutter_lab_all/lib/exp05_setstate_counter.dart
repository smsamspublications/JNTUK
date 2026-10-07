import 'package:flutter/material.dart';
void main() => runApp(const CounterApp());
 
class CounterApp extends StatelessWidget {       // never changes -> Stateless
  const CounterApp({super.key});
  @override
  Widget build(BuildContext context) =>
      const MaterialApp(home: CounterScreen());
}
 
class CounterScreen extends StatefulWidget {     // holds changing data -> Stateful
  const CounterScreen({super.key});
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}
 
class _CounterScreenState extends State<CounterScreen> {
  int _count = 0;                                // the data that changes
  void _increment() {
    setState(() {                                // tell Flutter to redraw
      _count++;                                  // change the data INSIDE setState
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('setState Counter')),
      body: Center(
        child: Text('Count: $_count',
            style: const TextStyle(fontSize: 32)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,                   // tap adds 1
        child: const Icon(Icons.add),
      ),
    );
  }
}
