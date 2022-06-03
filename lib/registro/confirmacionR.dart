import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proyecto_chivoflix/login/login.dart';

class ConfirmacionR extends StatefulWidget {
  ConfirmacionR({Key? key}) : super(key: key);
  static const String route = '/confirmacionr';

  @override
  State<ConfirmacionR> createState() => _ConfirmacionRState();
}

class _ConfirmacionRState extends State<ConfirmacionR> {
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        width: 300,
                        height: 350,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "REGISTRO EXITOSO",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 58, 58, 58),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Image.asset(
                                'assets/movie.png',
                                height: 200,
                              ),
                            ),
                            Container(
                              width: 350,
                              alignment: Alignment.topCenter,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                    "Te damos la bienvenida a CHIVOFLIX, la plataforma de peliculas en la que podras disfrutar de un enorme catalogo de contenido",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 58, 58, 58),
                                      fontFamily: 'Roboto',
                                    ),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  height: 40,
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
                    'Volver al Login',
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
              ],
            ),
          )),
    );
  }
}
