

import 'package:flutter/material.dart';
import 'package:proyecto_chivoflix/busqueda/pelicula.dart';

class BuscarPelicular extends StatefulWidget {
  static const String route = '/busqueda';
  BuscarPelicular({Key? key}) : super(key: key);

  @override
  State<BuscarPelicular> createState() => _BuscarPelicularState();
}

class _BuscarPelicularState extends State<BuscarPelicular>{

List<Pelicula> _peliculas =[
  Pelicula("Spider-man: No way home", "2h m", "image", false),
  Pelicula("Spider-man: Into the Spiderverse", "2h m", "image", false),
  Pelicula("Spider-man: No way home", "2h m", "image", false)

];

List<Pelicula> _foundPeli=[];

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _foundPeli=_peliculas;
    });
  }




 @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 38,
          child: TextField(
            decoration: InputDecoration(
              filled:true,
              fillColor: Colors.grey[850],
              contentPadding: EdgeInsets.all(0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none
              ),
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500
              ),
              hintText: "Buscar una pelicula"

            ),
          ),

        ),
      ),
      body: Container(
        color: Colors.grey.shade900,

      ),

    ) ;
  }
}