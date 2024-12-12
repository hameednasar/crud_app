import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateDataScreen extends StatefulWidget {
  final int postId;

  UpdateDataScreen({required this.postId});

  @override
  _UpdateDataScreenState createState() => _UpdateDataScreenState();
}

class _UpdateDataScreenState extends State<UpdateDataScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  Future<void> updatePost() async {
    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/${widget.postId}');
    final response = await http.put(
      url,
      body: {
        'title': titleController.text,
        'body': bodyController.text,
      },
    );

    if (response.statusCode == 200) {
      // Show a notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Post updated successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update post.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Post')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: updatePost,
              child: Text('Update Post'),
            ),
          ],
        ),
      ),
    );
  }
}
