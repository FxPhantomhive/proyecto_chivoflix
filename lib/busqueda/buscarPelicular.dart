

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
  Pelicula("Spider-man:\nNo way home", "2h m", "https://pics.filmaffinity.com/Spider_Man_No_Way_Home-642739124-large.jpg", false),
  Pelicula("Spider-man: \nInto the Spiderverse", "2h m", "https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_.jpg", false),
  Pelicula("Avengers\nInfinity War", "2h 35m", "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2018/04/vengadores-infinity-war-poster-imax.jpg?itok=rzHL0rTD", false),
  Pelicula("Star Wars\nThe last Jedi", "2h 32m", "https://static.wikia.nocookie.net/disney/images/7/7a/Star_Wars_The_Last_Jedi_Poster_Official.jpg/revision/latest?cb=20171010025646&path-prefix=es", false),
  Pelicula("Sherlock Holmes", "2h 8m", "https://m.media-amazon.com/images/M/MV5BMTg0NjEwNjUxM15BMl5BanBnXkFtZTcwMzk0MjQ5Mg@@._V1_.jpg", false),
  Pelicula("Morbius", "1h 44m", "https://www.ecartelera.com/carteles/14400/14458/001_m.jpg", false),

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

  setState(() {
    _foundPeli=_peliculas.where((pelicula) => pelicula.nombre.toLowerCase().contains(search)).toList();
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
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(pelicula.image),
                )
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(pelicula.nombre, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                  SizedBox(height: 5,
                  ),
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