import 'package:flutter/material.dart';
import 'package:proyecto_chivoflix/inicio/inicio.dart';
import 'package:proyecto_chivoflix/login/login.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Inicio.route,
      routes: {
        Login.route: (context) => Login(),
        Inicio.route: (context) => Inicio()
      },
    );
  }
}
