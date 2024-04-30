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

  Future<void> getApi() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
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
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
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
                          itemCount: data.length,
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
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      ReusableRow(title: 'Name: ',
                                          value: data![index]['name']
                                              .toString()),
                                      ReusableRow(title: 'Use Name: ',
                                          value: data![index]['username']
                                              .toString()),
                                      ReusableRow(title: 'Email: ',
                                          value: data![index]['email']
                                              .toString()),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'Address: ', style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),),
                                      ),
                                      ReusableRow(
                                          title: '               Street: ',
                                          value: data![index]['address']!['street']
                                              .toString()),
                                      ReusableRow(
                                          title: '               suite: ',
                                          value: data![index]['address']!['suite']
                                              .toString()),
                                      ReusableRow(
                                          title: '               City: ',
                                          value: data![index]['address']!['city']
                                              .toString()),
                                      ReusableRow(
                                          title: '               Zipcode: ',
                                          value: data![index]['address']!['zipcode']
                                              .toString()),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text('               Geo: ',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),),
                                      ),
                                      ReusableRow(
                                          title: '                       Lat: ',
                                          value: data![index]['address']!['geo']!['lat']
                                              .toString()),
                                      ReusableRow(
                                          title: '                       Lng: ',
                                          value: data![index]['address']!['geo']!['lng']
                                              .toString()),
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