class Usuario {
  final String idUsuarios; //cambio de tipo de int a string para prueba
  final String usuario;
  final String email;
  final String perfiles; //cambio de tipo de int a string para prueba
  final String imagen;
  final String idRol; //cambio de tipo de int a string para prueba
  final int idPlanes; //cambio de tipo de int a string para prueba

  Usuario(this.idUsuarios, this.usuario, this.email, this.perfiles, this.imagen,
      this.idRol, this.idPlanes);
}

List<Usuario> datosUsuario = [];
