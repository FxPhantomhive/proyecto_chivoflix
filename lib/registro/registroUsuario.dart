import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proyecto_chivoflix/login/login.dart';
import 'package:proyecto_chivoflix/registro/tarifa.dart';

class Registro extends StatefulWidget {
  static const String route = '/registro';
  Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final usuarioController = TextEditingController();
  final correoController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                "Registro de usuario",
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
                controller: correoController,
                style: TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Correo Electronico",
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
                controller: usuarioController,
                style: TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Usuario...",
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
                controller: passwordController,
                obscureText: true,
                style: TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Contraseña...",
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
                controller: confirmPassController,
                obscureText: true,
                style: TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Confirmar contraseña...",
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
                  if (confirmPassController.text == passwordController.text) {
                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: TarifaSelect(
                                correo: correoController.text,
                                usuario: usuarioController.text,
                                password: passwordController.text),
                            type: PageTransitionType.scale));
                  } else {
                    print("You shall no pass");
                  }
                },
                child: Text(
                  'Registrarse',
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

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_outlined, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 15),
              child: Image.asset("assets/spidey.jpg", width: 40, height: 40),
            )
          ],
        ),
      ),
    );
  }
}
