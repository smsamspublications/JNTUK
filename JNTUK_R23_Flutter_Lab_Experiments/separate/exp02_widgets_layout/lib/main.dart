import 'package:flutter/material.dart';   // Material Design widgets & colours
 
void main() => runApp(const MyApp());     // runApp paints the widget on screen
 
class MyApp extends StatelessWidget {      // a widget whose look never changes
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {     // build() describes what to draw
    return MaterialApp(                     // the root of a Material-style app
      home: Scaffold(                       // gives us a standard page (app bar + body)
        appBar: AppBar(title: const Text('Flutter Widgets')), // top bar
        body: Center(                        // centre the child on the page
          child: Container(                  // a box we can size, colour and pad
            padding: const EdgeInsets.all(16), // space inside the box
            color: Colors.amber.shade100,    // background colour
            child: Column(                   // arrange the children vertically
              mainAxisSize: MainAxisSize.min, // take only the height needed
              children: [
                const Text('Hello Widgets',  // Text shows a string
                    style: TextStyle(fontSize: 22)),
                const SizedBox(height: 12),  // an empty box used as a gap
                const Icon(Icons.flutter_dash, size: 60, color: Colors.blue), // an icon
                const SizedBox(height: 12),
                Image.network('https://picsum.photos/120', // load an image from the web
                    width: 120, height: 120),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
