import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class SignupLogin extends StatefulWidget {
  const SignupLogin({super.key});

  @override
  State<SignupLogin> createState() => _SignupLoginState();
}

class _SignupLoginState extends State<SignupLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Signup Login',
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
