import 'package:flutter/material.dart';

class MyInterests extends StatefulWidget {
  @override
  _MyInterestsState createState() => _MyInterestsState();
}

class _MyInterestsState extends State<MyInterests> {
  // List to store dynamic content
  List<String> interests = ['Reading', 'Music', 'Traveling'];

  // TextEditingController for the text field
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Interests')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Text field to input new interest
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter an interest',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add the new interest to the list
                setState(() {
                  if (_controller.text.isNotEmpty) {
                    interests.add(_controller.text);
                    _controller.clear(); // Clear the text field
                  }
                });
              },
              child: const Text('Add Interest'),
            ),
            const SizedBox(height: 20),
            // Displaying the list dynamically
            Expanded(
              child: ListView.builder(
                itemCount: interests.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        interests[index]), // Display interest at each index
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
