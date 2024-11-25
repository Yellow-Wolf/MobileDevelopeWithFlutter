import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//

class AddPostScreenTemplate extends StatefulWidget {
  /// make the screen introduce it self
  static getRoute(BuildContext context) {
    return PageRouteBuilder(
      transitionsBuilder: (_, animation, secondAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      pageBuilder: (_, __, ___) {
        return AddPostScreenTemplate();
      },
    );
  }

  const AddPostScreenTemplate({Key? key}) : super(key: key);

  @override
  _AddPostScreenTemplateState createState() => _AddPostScreenTemplateState();
}

class _AddPostScreenTemplateState extends State<AddPostScreenTemplate> {
  TextEditingController titleController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    commentController.dispose();
    super.dispose();
  }

  void createNamedParameter(String title, String comment) async {
    var response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "userId": 1,
        "id": 666,
        "title": title,
        "body": comment,
         // заменить на реальный ID пользователя
      }),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Post Added')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${response.reasonPhrase}')),
      );
    }

    // Дополнительный код для отправки данных
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                icon: Icon(Icons.title),
                filled: true,
                hintText: 'Write title here...',
                labelText: 'Title',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: commentController,
              decoration: const InputDecoration(
                icon: Icon(Icons.comment),
                filled: true,
                hintText: 'Write comment here...',
                labelText: 'Comment',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                //addComment();
                createNamedParameter(titleController.text, commentController.text);
              },
              child: Text("Add Comment".toUpperCase()),
            )
          ],
        ),
      ),
    );
  }

  addComment() {
    createNamedParameter(titleController.text, commentController.text);
  }
}