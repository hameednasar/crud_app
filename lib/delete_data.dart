import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteDataScreen extends StatelessWidget {
  final int postId;

  DeleteDataScreen({required this.postId});

  Future<void> deletePost() async {
    final response = await http.delete(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId'));

    if (response.statusCode == 200) {
      print('Post deleted');
    } else {
      throw Exception('Failed to delete post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Delete Post')),
      body: Center(
        child: ElevatedButton(
          onPressed: deletePost,
          child: Text('Delete'),
        ),
      ),
    );
  }
}
