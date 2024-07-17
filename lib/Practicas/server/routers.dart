// router.dart
import 'package:shelf_router/shelf_router.dart';

import 'handles.dart';

// Configuración del router
Router createRouter() {
  final router = Router();

  // Ruta para el login
  router.post('/login', loginHandler);

  return router;
}
