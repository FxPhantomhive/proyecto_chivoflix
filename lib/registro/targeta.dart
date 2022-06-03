import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_chivoflix/registro/confirmacionR.dart';
import 'package:proyecto_chivoflix/servidor.dart';
import 'package:proyecto_chivoflix/modelos/usuarios.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proyecto_chivoflix/login/login.dart';
import 'package:selectable_container/selectable_container.dart';

class RTargeta extends StatefulWidget {
  final String correo;
  final String usuario;
  final String password;
  final int tarifa;
  RTargeta(
      {Key? key,
      required this.correo,
      required this.usuario,
      required this.password,
      required this.tarifa})
      : super(key: key);

  @override
  State<RTargeta> createState() => _RTargetaState();
}

class _RTargetaState extends State<RTargeta> {
  Future<List<Usuario>> _setUsuarios(String correo, String usuario,
      String password, String tarifa, SnackBar login) async {
    var url = Uri.parse("${apiUrl}usuarios");
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "username": usuario,
          "email": correo,
          "password": password,
          "idPlanes": tarifa
        }));
    String cuerpo;
    datosUsuario = [];
    if (response.statusCode == 200) {
      //print(response.body);
      cuerpo = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(cuerpo);
      print(jsonData);
      /*for (var item in jsonData) {
        datosUsuario.add(Usuario(
            item["idUsuarios"],
            item["username"],
            item["email"],
            item["perfiles"],
            item["imagen"],
            item["idRol"],
            item["idPlanes"] ?? 0));
      }*/
      Navigator.push(
          context,
          PageTransition(
              alignment: Alignment.bottomCenter,
              child: Login(),
              type: PageTransitionType.scale));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(login);
      print("Nos Destruiran a todooooooooos");
    }
    return datosUsuario;
  }

  @override
  Widget build(BuildContext context) {
    /*print(widget.correo);
    print(widget.usuario);
    print(widget.password);
    print(widget.tarifa);*/
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/bannerchivo.png',
                height: 40,
              ),
              SizedBox(
                width: 50,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Theme.of(context).shadowColor,
        width: double.infinity,
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView(
            children: <Widget>[
              Text(
                "Ingrese sus datos de pago",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Numero de Tarjeta",
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
                style: TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Nombre en Tarjeta",
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
                style: TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Vencimiento (05/28)",
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
                style: TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "CVV",
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
                  String tar = widget.tarifa.toString();
                  final snackBarEspera = snackBarMensajes("Espere por favor...",
                      const Color.fromARGB(255, 23, 124, 26));
                  final snackBarErrorLogin = snackBarMensajes(
                      "Usuario y/o contraseña incorrectas",
                      const Color.fromARGB(255, 194, 35, 23));

                  final snackBarIncompleto = snackBarMensajes(
                      "Ingrese su usuario y contraseña",
                      const Color.fromARGB(255, 194, 35, 23));
                  if (widget.correo.isNotEmpty &&
                      widget.usuario.isNotEmpty &&
                      widget.password.isNotEmpty &&
                      tar.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBarEspera);
                    _setUsuarios(widget.correo, widget.usuario, widget.password,
                        tar, snackBarErrorLogin);

                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: ConfirmacionR(),
                            type: PageTransitionType.scale));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snackBarIncompleto);
                  }
                },
                child: Text(
                  'Procesar el Pago',
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
      ),
    );
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
      duration: const Duration(milliseconds: 2000),
      //width: 300,
    );
  }
}
