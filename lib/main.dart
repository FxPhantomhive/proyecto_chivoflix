import 'package:flutter/material.dart';
import 'package:proyecto_chivoflix/inicio/inicio.dart';
import 'package:proyecto_chivoflix/login/login.dart';
import 'package:proyecto_chivoflix/perfiles/perfiles.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: perfiles.route,
      routes: {
        Login.route: (context) => Login(),
        Inicio.route: (context) => Inicio(),
        perfiles.route: (context) => perfiles()
      },
    );
  }
}
