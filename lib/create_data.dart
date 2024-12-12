import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateDataScreen extends StatefulWidget {
  @override
  _CreateDataScreenState createState() => _CreateDataScreenState();
}

class _CreateDataScreenState extends State<CreateDataScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  Future<void> createPost(String title, String body) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: {'title': title, 'body': body},
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Post Created!')));
    } else {
      throw Exception('Failed to create post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Post')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title')),
            TextField(
                controller: bodyController,
                decoration: InputDecoration(labelText: 'Body')),
            ElevatedButton(
              onPressed: () {
                createPost(titleController.text, bodyController.text);
              },
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
