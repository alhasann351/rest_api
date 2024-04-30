import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/user_model.dart';

class WithoutModelCreate extends StatefulWidget {
  const WithoutModelCreate({super.key});

  @override
  State<WithoutModelCreate> createState() => _WithoutModelCreate();
}

class _WithoutModelCreate extends State<WithoutModelCreate> {

  var data;

  Future<void> getApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode == 200){
      data = jsonDecode(response.body.toString());
    }else{
      print('Error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Without Model Create Rest Api',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}