import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proyecto_chivoflix/login/login.dart';
import 'package:selectable_container/selectable_container.dart';

class RTargeta extends StatefulWidget {
  RTargeta({Key? key}) : super(key: key);

  @override
  State<RTargeta> createState() => _RTargetaState();
}

class _RTargetaState extends State<RTargeta> {
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
                obscureText: true,
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
                obscureText: true,
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
                obscureText: true,
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
                  Navigator.push(
                      context,
                      PageTransition(
                          alignment: Alignment.bottomCenter,
                          child: Login(),
                          type: PageTransitionType.scale));
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
}
