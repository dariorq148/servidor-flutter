/*
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:seridorflutter/Mysql/Conexion.dart';
import 'package:seridorflutter/Routes/Handlers/loginHandler.dart';
import 'package:shelf_router/shelf_router.dart';

Router createRouter(Conexion connect) {
  final router = Router();

  router.post('/login', loginHandler(connect));


  return router;
}

void main() async {
  final connManager = Conexion();
  final router = createRouter(connManager);

  // Pipeline para el manejo de middleware
  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router);

  // Iniciar el servidor en el puerto 8080
  final server = await io.serve(handler, 'localhost', 8080);
  print('Server listening on port ${server.port}');
}
*/
