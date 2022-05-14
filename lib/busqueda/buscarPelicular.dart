

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
  Pelicula("Spider-man: No way home", "2h m", "https://pics.filmaffinity.com/Spider_Man_No_Way_Home-642739124-large.jpg", false),
  Pelicula("Spider-man: Into the Spiderverse", "2h m", "https://pics.filmaffinity.com/Spider_Man_No_Way_Home-642739124-large.jpg", false),
  Pelicula("Spider-man: No way home", "2h m", "https://pics.filmaffinity.com/Spider_Man_No_Way_Home-642739124-large.jpg", false)

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

onSearch(String search){

  print(search);
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
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
              filled:true,
              fillColor: Colors.grey[850],
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade500,),
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
        child: ListView.builder(
          itemCount: _foundPeli.length,
          itemBuilder: (context,index){
            return userComponent(pelicula: _foundPeli[index]);
          }),

      ),

    ) ;
  }

   userComponent({required Pelicula pelicula}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(pelicula.image),
                )
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pelicula.nombre, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                  SizedBox(height: 5,),
                  Text(pelicula.duracion, style: TextStyle(color: Colors.grey[500])),
                ]
              )
            ]
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                pelicula.verMasTarde = !pelicula.verMasTarde;
              });
            },
            child: AnimatedContainer(
              height: 35,
              width: 75,
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: pelicula.verMasTarde ? Colors.blue[700] : Color(0xffffff),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: pelicula.verMasTarde ? Colors.transparent : Colors.grey.shade700,)
              ),
              child: Center(
                child: Text(pelicula.verMasTarde ? 'Delete' : 'Later', style: TextStyle(color: pelicula.verMasTarde ? Colors.white : Colors.white))
              )
            ),
          )
        ],
      ),
    );
  }
}