import 'package:flutter/material.dart';
void main() => runApp(const ListApp());
 
class ListApp extends StatelessWidget {
  const ListApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(home: ListScreen());
}
 
class ListScreen extends StatefulWidget {
  const ListScreen({super.key});
  @override
  State<ListScreen> createState() => _ListScreenState();
}
 
class _ListScreenState extends State<ListScreen> {
  final List<String> _items = [];                 // our growing list
  final TextEditingController _controller = TextEditingController();
 
  void _addItem() {
    if (_controller.text.isEmpty) return;         // ignore empty input
    setState(() {                                 // redraw with the new item
      _items.add(_controller.text);               // add typed text to the list
      _controller.clear();                        // empty the text field
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scrollable List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(                            // text field takes the free width
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Type an item'),
                  ),
                ),
                IconButton(icon: const Icon(Icons.add),
                    onPressed: _addItem),            // add button
              ],
            ),
          ),
          Expanded(                                  // list fills the rest of the screen
            child: ListView.builder(                 // builds rows as they scroll into view
              itemCount: _items.length,              // how many rows
              itemBuilder: (context, index) {        // build the row at 'index'
                return ListTile(
                  title: Text(_items[index]),        // show the item text
                  onTap: () {                        // when a row is tapped...
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content:
                          Text('You selected: ${_items[index]}')), // the prompt
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
