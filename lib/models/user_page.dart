import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'user_model.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserModel> userModelList = [];

  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      userModelList.clear();

      for (Map<dynamic, dynamic> user in data) {
        userModelList.add(UserModel.fromJson(user));
      }

      return userModelList;
    } else {
      return userModelList;
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
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
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
                    return ListView.builder(
                        itemCount: userModelList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4),
                            child: Card(
                              elevation: 10,
                              color: Colors.white,
                              shadowColor: Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ReusableRow(title: 'Name: ', value: snapshot.data![index].name.toString()),
                                    ReusableRow(title: 'Use Name: ', value: snapshot.data![index].username.toString()),
                                    ReusableRow(title: 'Email: ', value: snapshot.data![index].email.toString()),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text('Address: ', style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),),
                                    ),
                                    ReusableRow(title: '               Street: ', value: snapshot.data![index].address!.street.toString()),
                                    ReusableRow(title: '               suite: ', value: snapshot.data![index].address!.suite.toString()),
                                    ReusableRow(title: '               City: ', value: snapshot.data![index].address!.city.toString()),
                                    ReusableRow(title: '               Zipcode: ', value: snapshot.data![index].address!.zipcode.toString()),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text('               Geo: ', style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),),
                                    ),
                                    ReusableRow(title: '                       Lat: ', value: snapshot.data![index].address!.geo!.lat.toString()),
                                    ReusableRow(title: '                       Lng: ', value: snapshot.data![index].address!.geo!.lng.toString()),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;

  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
