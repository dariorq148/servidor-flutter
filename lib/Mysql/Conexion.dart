import 'package:mysql_client/mysql_client.dart';

class Conexion {
  Future<MySQLConnection> getConnection() async {
    final conn = await MySQLConnection.createConnection(
      host: "localhost",
      port: 3306,
      userName: "root",
      password: "root",
      databaseName: "UniversidadPrueba",
    );
    await conn.connect();
    return conn;
  }

  Future<void> close(MySQLConnection? conn) async {
    if (conn != null) {
      await conn.close();
    }
  }
}
