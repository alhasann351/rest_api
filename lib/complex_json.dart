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
  Future<ComplexJsonModel> getApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/a2bb12bb-ac0d-493b-9368-b42520370925'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ComplexJsonModel.fromJson(data);
    } else {
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
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<ComplexJsonModel>(
            future: getApi(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 1,
                            color: Colors.red,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.data![index].images!.length,
                                itemBuilder: (context, position) {
                                  return Container(
                                    //color: Colors.green,
                                    height:
                                    MediaQuery.of(context).size.height * 0.25,
                                    width:
                                    MediaQuery.of(context).size.width * 0.5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(snapshot
                                          .data!.data![index].images![position].url
                                          .toString()),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      );
                    });
              }else{
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
              }
            },
          )),
        ],
      ),
    );
  }
}
