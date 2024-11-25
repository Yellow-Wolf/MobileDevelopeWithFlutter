import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AddPostScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.teal, accentColor: Colors.blueGrey)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> postsList = [];
  bool isLoading = false;

  Future<void> _getPosts() async {
    setState(() {
      isLoading = true;
    });

    // Запуск http.get перед задержкой
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    // Задержка в 3 секунды
    await Future.delayed(Duration(seconds: 3));

    if (response.statusCode == 200) {
      List<Post> newPostsList = [];
      List jsonArray = json.decode(response.body) as List;
      jsonArray.forEach((element) {
        Post post = Post.fromJson(element);
        newPostsList.add(post);
      });

      setState(() {
        isLoading = false;
        postsList = newPostsList;
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts List"),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator() // Показываем индикатор загрузки вместо RefreshIndicator
            : RefreshIndicator( // Показываем RefreshIndicator только когда нет загрузки
          onRefresh: _getPosts,
          child: buildUserList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPostScreenTemplate())); //Navigator.push(context, AddUserScreen.getRoute());
        },
        child: Icon(Icons.add_comment_sharp),
      ),
    );
  }

  Widget buildUserList() {
    return postsList.isEmpty
        ? buildEmptyView()
        : ListView.builder(
      itemCount: postsList.length,
      itemBuilder: (context, index) {
        Post post = postsList[index];
        return Column(
          children: [
            ListTile(
              leading: Icon(Icons.comment_outlined),
              title: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(post.body),
            ),
            SizedBox(height: 16),
            Divider(),
          ],
        );
      },
    );
  }

  Widget buildEmptyView() {
    return ElevatedButton(
      onPressed: () {
        _getPosts();
      },
      child: Text('Press me'),
    );
  }
}

class Post {
  late int userId;
  late int id;
  late String title;
  late String body;

  Post(
      {required this.userId,
        required this.id,
        required this.title,
        required this.body});

  Post.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    userId = json["userId"] ?? "";
    title = json["title"] ?? "";
    body = json["body"] ?? "";
  }

  @override
  String toString() {
    return 'Post{userId: $userId, id: $id, title: $title} \n \n ---------- ';
  }
}