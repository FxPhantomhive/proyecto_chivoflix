import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proyecto_chivoflix/reproductor/reproductor.dart';

class detallePelicula extends StatefulWidget {
  final String nombre;
  final int id;
  final String descrip;
  final String imagen;
  final String urlpeli;

  static const String route = '/Detalle';
  detallePelicula(
      {Key? key,
      required this.nombre,
      required this.id,
      required this.descrip,
      required this.imagen,
      required this.urlpeli})
      : super(key: key);

  @override
  State<detallePelicula> createState() => _detallePeliculaState();
}

class _detallePeliculaState extends State<detallePelicula> {
  double alto = 0;
  @override
  Widget build(BuildContext context) {
    alto = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(children: [
        appBar(),
        body(),
      ]),
    );
  }

  Widget body() {
    return SizedBox(
      height: alto * 0.85,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 450,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(widget.imagen),
              )),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.nombre,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "assets/consolidado.png",
                width: 150,
              ),
            ),
            SizedBox(
                child: ElevatedButton.icon(
              label: const Text('Ver Pelicula'),
              style: ElevatedButton.styleFrom(primary: Colors.grey),
              icon: const Icon(Icons.play_arrow),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        alignment: Alignment.bottomCenter,
                        child: Reproductor(
                          urlpeli: widget.urlpeli,
                        ),
                        type: PageTransitionType.scale));
              },
            )),
            /*SizedBox(
                child: ElevatedButton.icon(
              label: const Text(
                'Descargar',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.white),
              icon: const Icon(
                Icons.download,
                color: Colors.black,
              ),
              onPressed: () {},
            )),*/
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.descrip,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
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
