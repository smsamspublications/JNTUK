import 'package:flutter/material.dart';
void main() => runApp(const NavApp());
 
class NavApp extends StatelessWidget {
  const NavApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(home: FirstScreen());
}
 
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to Second Screen'),
          onPressed: () {                       // runs when tapped
            Navigator.push(                     // open a new screen on top
              context,
              MaterialPageRoute(builder: (_) => const SecondScreen()), // which screen
            );
          },
        ),
      ),
    );
  }
}
 
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go Back'),
          onPressed: () => Navigator.pop(context), // remove this screen, reveal the last
        ),
      ),
    );
  }
}
