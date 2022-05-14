import 'package:flutter/material.dart';

class detallePelicula extends StatefulWidget {
  static const String route = '/Detalle';
  detallePelicula({Key? key}) : super(key: key);

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
              height: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    "https://cdn-3.expansion.mx/dims4/default/9491d3a/2147483647/strip/true/crop/1200x800+0+0/resize/1200x800!/format/webp/quality/90/?url=https%3A%2F%2Fcdn-3.expansion.mx%2Fa9%2Fcb%2Fae6b5a1f4c5199e2ea4d8ca6f607%2Fmeme-spider-man-tom-andrew-tobey.jpg"),
              )),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10),
              child: const Text(
                "Spiderman: No Way Home",
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
              label: const Text('Ver'),
              style: ElevatedButton.styleFrom(primary: Colors.grey),
              icon: const Icon(Icons.play_arrow),
              onPressed: () {},
            )),
            SizedBox(
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
            )),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Después de que Mysterio desvelara la identidad de Spider-Man a todo el mundo en Lejos de casa, Peter Parker (Tom Holland), desesperado por volver a la normalidad y recuperar su anterior vida, pide ayuda a Doctor Strange para enmendar tal acción. El Hechicero Supremo de Marvel accede a ayudar al joven Hombre Araña, sin embargo, algo sale mal y el multiverso se convierte en la mayor amenaza hasta el momento.",
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
