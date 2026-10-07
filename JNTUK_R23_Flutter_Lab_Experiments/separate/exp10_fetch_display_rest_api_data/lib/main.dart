import 'dart:convert';                              // jsonDecode lives here
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;          // the http package, aliased 'http'
 
void main() => runApp(const ApiApp());
 
class ApiApp extends StatelessWidget {
  const ApiApp({super.key});
  @override
  Widget build(BuildContext context) =>
      const MaterialApp(home: UserListScreen());
}
 
class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});
 
  // Calls the API and returns the decoded list of users.
  Future<List<dynamic>> fetchUsers() async {
    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/users'); // the API endpoint
    final response = await http.get(url);          // wait for the network reply
    if (response.statusCode == 200) {              // 200 = success
      return jsonDecode(response.body);            // JSON text -> Dart list/maps
    } else {
      throw Exception('Failed to load users');     // surface the error to the UI
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('REST API Data')),
      body: FutureBuilder<List<dynamic>>(          // rebuilds when the future finishes
        future: fetchUsers(),                      // the async work to wait for
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // 'please hold' spinner
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}')); // show any error
          }
          final users = snapshot.data!;            // data has arrived
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(users[index]['name']),  // read the 'name' field
                subtitle: Text(users[index]['email']),// read the 'email' field
              );
            },
          );
        },
      ),
    );
  }
}
