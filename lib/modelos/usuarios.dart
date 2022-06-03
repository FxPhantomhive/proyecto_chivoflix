class Usuario {
  final int idUsuarios;
  final String usuario;
  final String email;
  final int perfiles;
  final String imagen;
  final int idRol;
  final int idPlanes;

  Usuario(this.idUsuarios, this.usuario, this.email, this.perfiles, this.imagen,
      this.idRol, this.idPlanes);
}

List<Usuario> datosUsuario = [];
