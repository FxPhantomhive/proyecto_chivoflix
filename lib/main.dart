import 'package:flutter/material.dart';
import 'package:proyecto_chivoflix/busqueda/buscarPelicular.dart';
import 'package:proyecto_chivoflix/inicio/inicio.dart';
import 'package:proyecto_chivoflix/login/login.dart';
import 'package:proyecto_chivoflix/perfiles/perfiles.dart';
import 'package:proyecto_chivoflix/registro/registroUsuario.dart';
import 'package:proyecto_chivoflix/detalle/detallePelicula.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Login.route,
      //initialRoute: perfiles.route,
      routes: {
        Login.route: (context) => Login(),
        Inicio.route: (context) => Inicio(),
        perfiles.route: (context) => perfiles(),
        BuscarPelicular.route: (context) => BuscarPelicular(),
        Registro.route: (context) => Registro(),
        detallePelicula.route: (context) => detallePelicula()
      },
    );
  }
}
