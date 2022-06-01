import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:page_transition/page_transition.dart';
import 'package:proyecto_chivoflix/modelos/peliculasmodelo.dart';
import 'package:proyecto_chivoflix/detalle/detallePelicula.dart';
import 'package:proyecto_chivoflix/servidor.dart';

class ListadoPelis extends StatefulWidget {
  ListadoPelis({Key? key}) : super(key: key);
  static const String route = '/listadoPelis';

  @override
  State<ListadoPelis> createState() => _ListadoPelisState();
}

class _ListadoPelisState extends State<ListadoPelis> {
  late Future<List<Peliculas>> _listadoPeliculas;
  Future<List<Peliculas>> _getPeliculas() async {
    final response = await http.get(Uri.parse('${apiUrl}peliculas'));
    String cuerpo;
    List<Peliculas> listado = [];
    if (response.statusCode == 200) {
      //print(response.body);
      cuerpo = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(cuerpo);
      for (var item in jsonData) {
        listado.add(Peliculas(
            item['idPeliculas'],
            item['nombre'],
            item['anioEstreno'],
            item['categoriaEdad'],
            item['descripcion'],
            item['calidad'],
            item['director'],
            item['banner'],
            item['Pelicula'] ?? ""));
      }
    } else {
      throw Exception("Falla en conexion  estado 500");
    }
    return listado;
  }

  @override
  void initState() {
    super.initState();
    _listadoPeliculas = _getPeliculas();
  }

  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder(
        future: _listadoPeliculas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: ListView(
                children: [
                  Container(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: _listadoPeliculass(snapshot.data),
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Error");
          }
          return Center(child: CircularProgressIndicator());
        });
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 460,
                height: 450,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/spiderman.jpg"),
                        fit: BoxFit.cover)),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: futureBuilder,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _listadoPeliculass(data) {
    List<Widget> peliculalist = [];
    for (var itempeli in data) {
      // String imagen = "assets/" + itempeli.banner;
      peliculalist.add(Container(
          child: GestureDetector(
        onTap: () => {
          Navigator.push(
              context,
              PageTransition(
                  alignment: Alignment.bottomCenter,
                  child: detallePelicula(
                    id: itempeli.idPeliculas,
                    nombre: itempeli.nombre,
                    descrip: itempeli.descripcion,
                    imagen: "assets/" + itempeli.banner,
                    urlpeli: "assets/" + itempeli.pelicula,
                  ),
                  type: PageTransitionType.scale))
        },
        child: Card(
          color: Colors.black,
          elevation: 0.5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 70,
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/" + itempeli.banner),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 250,
                  child: Column(
                    children: [
                      Container(
                        width: 250,
                        child: Text(
                          itempeli.nombre,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto'),
                        ),
                      ),
                      Text(
                        itempeli.descripcion,
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      )));
    }
    return peliculalist;
  }
}
