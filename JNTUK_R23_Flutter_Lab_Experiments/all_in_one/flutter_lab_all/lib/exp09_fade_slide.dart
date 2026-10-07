import 'package:flutter/material.dart';
void main() => runApp(const AnimationApp());
 
class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});
  @override
  Widget build(BuildContext context) =>
      const MaterialApp(home: AnimationScreen());
}
 
class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});
  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}
 
class _AnimationScreenState extends State<AnimationScreen> {
  bool _visible = true;                           // controls the fade
  double _offset = 0;                             // controls the slide distance
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animations')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(                        // smoothly changes transparency
              opacity: _visible ? 1.0 : 0.0,        // 1 = visible, 0 = invisible
              duration: const Duration(seconds: 1), // how long the fade lasts
              child: Container(width: 120, height: 120, color: Colors.purple),
            ),
            const SizedBox(height: 30),
            AnimatedContainer(                      // animates size / position changes
              duration: const Duration(milliseconds: 600),
              transform: Matrix4.translationValues(_offset, 0, 0), // slide on X
              child: const Icon(Icons.directions_run, size: 60),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('Fade'),
              onPressed: () =>
                  setState(() => _visible = !_visible),     // flip visibility
            ),
            ElevatedButton(
              child: const Text('Slide'),
              onPressed: () =>
                  setState(() => _offset = _offset == 0 ? 120 : 0), // flip position
            ),
          ],
        ),
      ),
    );
  }
}
