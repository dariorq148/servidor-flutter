class User {
  final int id;
  final String nombre;
  final String apellidos;
  final String email;
  final String password;
  final String direccion;
  final String telefono;

  User(
      {required this.id,
      required this.nombre,
      required this.apellidos,
      required this.email,
      required this.password,
      required this.direccion,
      required this.telefono});
}
