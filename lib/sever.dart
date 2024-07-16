import 'dart:convert';
import 'package:seridorflutter/Mysql/Conexion.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';



// Configuración del router
Router _router() {
  final router = Router();

  // Ruta para el login
  router.post('/login', _loginHandler);

  return router;
}

// Handler para la ruta de login
Future<Response> _loginHandler(Request request) async {
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

void main() async {
  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(_router());

  final server = await shelf_io.serve(handler, 'localhost', 8080);
  print('Server listening on http://localhost:${server.port}');
  print('Routes: /login');
}
