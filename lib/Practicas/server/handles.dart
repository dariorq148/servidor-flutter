// handlers.dart
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:mysql_client/mysql_client.dart';
import '../../Mysql/Conexion.dart';

// Handler para la ruta de login
Future<Response> loginHandler(Request request) async {
  final payload = await request.readAsString();
  final data = jsonDecode(payload) as Map<String, dynamic>;

  final email = data['email'] as String?;
  final password = data['password'] as String?;

  if (email == null || password == null) {
    return Response(400, body: 'Email and password are required');
  }

  final dbConnection = Conexion();
  final conn = await dbConnection.getConnection();
  final result = await conn.execute(
    'SELECT * FROM usuarios WHERE email = :email AND password = :password',
    {'email': email, 'password': password},
  );

  await dbConnection.close(conn);

  if (result.rows.isNotEmpty) {
    return Response.ok(jsonEncode({'status': 'success', 'message': 'Login successful'}));
  } else {
    return Response(401, body: jsonEncode({'status': 'fail', 'message': 'Invalid credentials'}));
  }
}
