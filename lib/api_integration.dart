import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/photos_model.dart';

class ApiIntegration extends StatefulWidget {
  const ApiIntegration({super.key});

  @override
  State<ApiIntegration> createState() => _ApiIntegration();
}

class _ApiIntegration extends State<ApiIntegration> {
  
  List<Photos> photosModelList = [];
  
  Future<List<Photos>> getPhotosApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    
    if(response.statusCode == 200){
      photosModelList.clear();
      for(Map<dynamic, dynamic> photo in data){
        Photos photos = Photos(title: photo['title'], url: photo['url'], id: photo['id']);
        photosModelList.add(photos);
      }
      return photosModelList;
    }else{
      return photosModelList;
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
    );
  }
}