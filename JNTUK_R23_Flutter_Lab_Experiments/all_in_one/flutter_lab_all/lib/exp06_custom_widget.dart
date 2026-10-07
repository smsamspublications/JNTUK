import 'package:flutter/material.dart';
void main() => runApp(const CustomWidgetApp());
 
class CustomWidgetApp extends StatelessWidget {
  const CustomWidgetApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Widgets')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ProfileCard(name: 'Asha', role: 'Student'),  // reuse #1
              SizedBox(height: 16),
              ProfileCard(name: 'Ravi', role: 'Faculty'),  // reuse #2
            ],
          ),
        ),
      ),
    );
  }
}
 
// Our own widget. Build once, reuse with different data.
class ProfileCard extends StatelessWidget {
  final String name;                              // data passed in from outside
  final String role;
  const ProfileCard({super.key, required this.name, required this.role});
  @override
  Widget build(BuildContext context) {
    return Card(                                    // Material card with a shadow
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(child: Icon(Icons.person)), // round avatar
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
                Text(role, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
