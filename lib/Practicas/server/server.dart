// main.dart
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

import 'routers.dart';

void main() async {
  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(createRouter());

  final server = await shelf_io.serve(handler, 'localhost', 8080);
  print('Server listening on http://localhost:${server.port}');
  print('Routes: /login');
}
