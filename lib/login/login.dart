import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proyecto_chivoflix/modelos/peliculasmodelo.dart';
import 'package:proyecto_chivoflix/modelos/usuarios.dart';
import 'package:proyecto_chivoflix/registro/registroUsuario.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_chivoflix/servidor.dart';

class Login extends StatefulWidget {
  static const String route = '/login';
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usuarioController = TextEditingController();
  final passwordController = TextEditingController();
  Future<List<Usuario>> _getLogin(
      String usuario, String password, SnackBar login) async {
    var url = Uri.parse("${apiUrl}loginf");
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
            <String, String>{"username": usuario, "password": password}));
    String cuerpo;
    datosUsuario = [];
    if (response.statusCode == 200) {
      //print(response.body);
      cuerpo = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(cuerpo);
      print(jsonData);
      for (var item in jsonData) {
        datosUsuario.add(Usuario(
            item["idUsuarios"],
            item["username"],
            item["email"],
            item["perfiles"],
            item["imagen"],
            item["idRol"],
            item["idPlanes"] ?? 0));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(login);
    }
    return datosUsuario;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(15),
      color: Theme.of(context).shadowColor,
      width: double.infinity,
      child: Align(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Image.asset(
              'assets/bannerchivo.png',
              height: 130,
            ),
            TextField(
              controller: usuarioController,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Username...",
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5))),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Password...",
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5))),
            ),
            SizedBox(
              height: 60,
            ),
            FlatButton(
              onPressed: () {
                final snackBarEspera = snackBarMensajes("Espere por favor...",
                    const Color.fromARGB(255, 23, 124, 26));
                final snackBarErrorLogin = snackBarMensajes(
                    "Usuario y/o contraseña incorrectas",
                    const Color.fromARGB(255, 194, 35, 23));

                final snackBarIncompleto = snackBarMensajes(
                    "Ingrese su usuario y contraseña",
                    const Color.fromARGB(255, 194, 35, 23));

                if (passwordController.text.isNotEmpty &&
                    usuarioController.text.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBarEspera);
                  _getLogin(usuarioController.text, passwordController.text,
                      snackBarErrorLogin);
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBarIncompleto);
                }
              },
              child: Text(
                'INGRESAR',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(15),
              textColor: Colors.white,
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        alignment: Alignment.bottomCenter,
                        child: Registro(),
                        type: PageTransitionType.scale));
              },
              child: Text(
                'REGISTRARSE',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(15),
              textColor: Colors.white,
            ),
            SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                '¿En que podemos ayudarte?',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Universidad Tecnologica de El Salvador',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  SnackBar snackBarMensajes(String mensaje, Color color) {
    return SnackBar(
      content: Text(
        mensaje,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      elevation: 20,
      duration: const Duration(milliseconds: 1000),
      //width: 300,
    );
  }
}
