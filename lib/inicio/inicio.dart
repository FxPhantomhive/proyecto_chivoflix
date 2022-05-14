import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:proyecto_chivoflix/inicio/datos.dart';

class Inicio extends StatefulWidget {
  static const String route = '/inicio';
  Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/spiderman.jpg"), fit: BoxFit.cover)),
      child: FooterView(
          children: <Widget>[
            SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  children: [encabezado()],
                ),
              ),
            ),
          ],
          footer: Footer(
              backgroundColor: Colors.black,
              child: Container(
                child: footer(),
              ))),
    ));
  }

  Widget encabezado() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 25, left: 25),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(encabezados.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  i = index;
                });
              },
              child: Container(
                width: 80,
                height: 25,
                decoration: BoxDecoration(
                    color: i == index
                        ? Colors.red
                        : const Color.fromARGB(175, 110, 107, 107),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(child: texto(encabezados[index])),
              ),
            );
          })),
    );
  }

  Widget texto(String mensaje) {
    return Text(
      mensaje,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget footer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: InkWell(
              onTap: () {},
              child: Column(
                children: const [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  Text(
                    "Mi lista",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 110,
              height: 30,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 219, 216, 216)),
              child: InkWell(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.play_circle),
                      Text("Reproducir")
                    ]),
              ),
            ),
          ),
          SizedBox.fromSize(
            child: InkWell(
              onTap: () {},
              child: Column(
                children: const [
                  Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  Text(
                    "Información",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
