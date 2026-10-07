import 'package:flutter/material.dart';
void main() => runApp(const NamedRouteApp());
 
class NamedRouteApp extends StatelessWidget {
  const NamedRouteApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',                     // the first screen to show
      routes: {                               // a directory of name -> screen
        '/':        (context) => const HomeScreen(),
        '/details': (context) => const DetailsScreen(),
      },
    );
  }
}
 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Details'),
          onPressed: () => Navigator.pushNamed(context, '/details'), // go by name
        ),
      ),
    );
  }
}
 
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Back to Home'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
