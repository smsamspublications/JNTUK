import 'package:flutter/material.dart';
import 'package:provider/provider.dart';          // the Provider package
 
void main() {
  runApp(
    ChangeNotifierProvider(                        // share CounterModel with the tree
      create: (_) => CounterModel(),
      child: const MyApp(),
    ),
  );
}
 
class CounterModel extends ChangeNotifier {        // the shared whiteboard
  int _count = 0;
  int get count => _count;                         // read-only access
  void increment() {
    _count++;                                      // change the value
    notifyListeners();                             // tell everyone watching to rebuild
  }
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) =>
      const MaterialApp(home: CounterPage());
}
 
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Counter')),
      body: Center(
        child: Text(
          'Count: ${context.watch<CounterModel>().count}', // watch = rebuild on change
          style: const TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read<CounterModel>().increment(), // read = call once, no rebuild
        child: const Icon(Icons.add),
      ),
    );
  }
}
