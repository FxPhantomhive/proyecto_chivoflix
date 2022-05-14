import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String route = '/login';
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text("dieguito se la come")),
    );
  }
}
