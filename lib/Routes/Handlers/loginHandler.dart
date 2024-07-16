/*
import 'package:mysql_client/mysql_client.dart';
import 'package:shelf/shelf.dart';
import 'dart:convert';
import '../../User/classUser.dart';
import 'package:seridorflutter/Mysql/Conexion.dart';

Handler loginHandler(Conexion connect) {
  return (Request request) async {
    Future<User?> logger(String email, String password) async {
      MySQLConnection? conn;
      try {
        conn = await connect.getConnection();
        var result = await conn.execute(
          'SELECT * FROM usuarios WHERE email = :email AND password = :password',
          {'email': email, 'password': password},
        );

        if (result.rows.isNotEmpty) {
          var row = result.rows.first;
          return User(
            id: int.parse(row.colAt(0)!),
            nombre: row.colAt(1)!,
            apellidos: row.colAt(2)!,
            email: row.colAt(3)!,
            password: row.colAt(4)!,
            direccion: row.colAt(5)!,
            telefono: row.colAt(6)!,
          );
        } else {
          return null;
        }
      } catch (e) {
        print('Error: $e');
        return null;
      } finally {
        await connect.close(conn); // Cerrar la conexión aquí
      }
    }

    if (request.method == 'POST') {
      var payload = await request.readAsString();
      var data = json.decode(payload);

      var email = data['email'];
      var password = data['password'];

      if (email == null || password == null) {
        return Response(400, body: 'Email and password must be provided');
      }

      var user = await logger(email, password);

      if (user != null) {
        return Response.ok('Inicio de sesión exitoso');
      } else {
        return Response.forbidden('Credenciales inválidas');
      }
    } else {
      return Response(405, body: 'Método no permitido');
    }
  };
}
*/
