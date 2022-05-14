import 'package:flutter/material.dart';
import 'package:proyecto_chivoflix/busqueda/buscarPelicular.dart';
import 'package:proyecto_chivoflix/login/login.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: BuscarPelicular.route,
      routes: {Login.route: (context) => Login(),
      BuscarPelicular.route: (context) => BuscarPelicular()},
    );
  }
}
