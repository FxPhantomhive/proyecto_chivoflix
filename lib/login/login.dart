import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proyecto_chivoflix/modelos/peliculasmodelo.dart';
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
  Future<List<Peliculas>> _getLogin(String usuario, String password) async {
    var url = Uri.parse("${apiUrl}loginf");
    final response = await http.post(url,headers:);
    String cuerpo;
    List<Peliculas> listado = [];
    if (response.statusCode == 200) {
      //print(response.body);
      cuerpo = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(cuerpo);
    } else {
      throw Exception("Falla en conexion  estado 500");
    }
    return listado;
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
              style: const TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Username...",
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5))),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: true,
              style: TextStyle(fontSize: 18, color: Colors.black54),
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
              onPressed: () {},
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
}
