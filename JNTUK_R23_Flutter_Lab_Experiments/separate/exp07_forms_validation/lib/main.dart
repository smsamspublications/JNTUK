import 'package:flutter/material.dart';
void main() => runApp(const FormApp());
 
class FormApp extends StatelessWidget {
  const FormApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(home: FormScreen());
}
 
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});
  @override
  State<FormScreen> createState() => _FormScreenState();
}
 
class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();        // the clipboard that controls the form
  final _emailController = TextEditingController(); // reads what is typed in email
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form & Validation')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,                            // attach the clipboard
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) =>                 // return error text or null
                    (value == null || value.isEmpty)
                        ? 'Please enter your name' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter an email';
                  if (!value.contains('@'))   return 'Enter a valid email'; // simple rule
                  return null;                        // null = this field is valid
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) { // run every validator
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form is valid! Submitted.')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
 
  @override
  void dispose() {
    _emailController.dispose();                   // free the controller when done
    super.dispose();
  }
}
