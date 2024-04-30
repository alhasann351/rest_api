import 'package:flutter/material.dart';
import 'package:rest_api/api_integration.dart';
import 'package:rest_api/models/user_page.dart';
import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserPage(),
    );
  }
}
