import 'package:flutter/material.dart';
void main() => runApp(const ThemeApp());
 
class ThemeApp extends StatelessWidget {
  const ThemeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(                             // one place for the app's look
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple),          // generate a matching palette
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18,        // default style for body text
              color: Colors.deepPurple),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(// style ALL buttons at once
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Themes & Styles')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Styled by the theme',
                  style: Theme.of(context).textTheme.bodyLarge), // pull from theme
              const SizedBox(height: 16),
              ElevatedButton(onPressed: () {},
                  child: const Text('Themed Button')), // inherits the button theme
            ],
          ),
        ),
      ),
    );
  }
}
