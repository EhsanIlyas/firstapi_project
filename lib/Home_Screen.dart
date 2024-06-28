import 'dart:convert';
import 'package:flutter/material.dart';
import 'Post_model.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<PostModel> postList = [];

Future<List<PostModel>> getPostApi() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    postList.clear();
    for (var i in data) {
      postList.add(PostModel.fromJson(i as Map<String, dynamic>));
    }
    return postList;
  } else {
    return postList;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Project"),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: getPostApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(postList[index].title),
                        subtitle: Text(postList[index].body),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
