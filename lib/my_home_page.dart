import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/posts_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String id = 'ID : ';
  String title = 'Title : ';
  String body = 'Body : ';
  List<PostsModel> postsModelList = [];

  Future<List<PostsModel>> getPostsApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<dynamic, dynamic> posts in data) {
        postsModelList.add(PostsModel.fromJson(posts));
      }
      return postsModelList;
    } else {
      return postsModelList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Rest Api',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
            future: getPostsApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text(
                    'Loading',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                );
              } else {
                return ListView.builder(itemCount: postsModelList.length, itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('$id ${postsModelList[index].id}'),
                          Text('$title ${postsModelList[index].title.toString()}'),
                          Text('$body ${postsModelList[index].body.toString()}'),
                        ],
                      ),
                    ),
                  );
                });
              }
            },
          ),
        ),
      ]),
    );
  }
}
