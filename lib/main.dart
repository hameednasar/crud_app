import 'package:flutter/material.dart';
import 'fetch_data.dart';
import 'create_data.dart';
import 'update_data.dart';
import 'delete_data.dart';

void main() {
  runApp(MaterialApp(
    home: MenuScreen(), // Change this to MenuScreen
    routes: {
      '/fetch': (context) => FetchDataScreen(),
      '/create': (context) => CreateDataScreen(),
      '/update': (context) =>
          UpdateDataScreen(postId: 1), // Pass a postId for update
      '/delete': (context) =>
          DeleteDataScreen(postId: 1), // Pass a postId for delete
    },
  ));
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRUD App Menu')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/fetch'); // Navigate to Fetch Users
              },
              child: Text('Fetch Users'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/create'); // Navigate to Create Post
              },
              child: Text('Create Post'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/update'); // Navigate to Update Post
              },
              child: Text('Update Post'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/delete'); // Navigate to Delete Post
              },
              child: Text('Delete Post'),
            ),
          ],
        ),
      ),
    );
  }
}
