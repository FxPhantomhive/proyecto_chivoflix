import 'package:flutter/material.dart';

class Peliculas {
  int idPeliculas = 0;
  String nombre = "";
  String anioEstreno = "";
  String categoriaEdad = "";
  String descripcion = "";
  String calidad = "";
  String director = "";
  String banner = "";
  String Pelicula = "";

  Peliculas(idPeliculas, nombre, anioEstreno, categoriaEdad, descripcion,
      calidad, director, banner, Pelicula) {
    this.idPeliculas = idPeliculas;
    this.nombre = nombre;
    this.anioEstreno = anioEstreno;
    this.categoriaEdad = categoriaEdad;
    this.descripcion = descripcion;
    this.calidad = calidad;
    this.director = director;
    this.banner = banner;
    this.Pelicula = Pelicula;
  }
}
