import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/complex_json_model.dart';

class ComplexJson extends StatefulWidget {
  const ComplexJson({super.key});

  @override
  State<ComplexJson> createState() => _ComplexJsonState();
}

class _ComplexJsonState extends State<ComplexJson> {

  Future<ComplexJsonModel> getApi() async{
    final response = await http.get(Uri.parse('https://webhook.site/a2bb12bb-ac0d-493b-9368-b42520370925'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      return ComplexJsonModel.fromJson(data);
    }else{
      return ComplexJsonModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Complex Json',
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
