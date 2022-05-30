import 'package:flutter/material.dart';

class Login {
  String idUsuarios = "";
  String username = "";
  String email = "";
  String password = "";
  int perfiles = 0;
  String imagen = "";
  String idRol = "";
  String idPlanes = "";

  Login(idUsuarios, username, email, password, perfiles, imagen, idRol,
      idPlanes) {
    this.idUsuarios = idUsuarios;
    this.username = username;
    this.email = email;
    this.password = password;
    this.perfiles = perfiles;
    this.imagen = imagen;
    this.idRol = idRol;
    this.idPlanes = idPlanes;
  }
}

class Env {
  static String URL_PREFIX = "http://127.0.0.1:8000/api/";
}
