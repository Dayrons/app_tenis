import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DB {
  List tables = [
    'CREATE TABLE usuarios (id INTEGER PRIMARY KEY, nombre TEXT, foto TEXT,apellido TEXT, email TEXT, telefono TEXT)',
    'CREATE TABLE estados (id INTEGER PRIMARY KEY, nombre TEXT)',
    'CREATE TABLE canchas (id INTEGER PRIMARY KEY, nombre TEXT, precio TEXT ,direccion TEXT, superficie TEXT NULL ,iluminacion INTEGER NULL,descripcion TEXT NULL, imagen TEXT, lat TEXT, long TEXT, id_usuario INTEGER, FOREIGN KEY(id_usuario) REFERENCES usuarios(id))',
    'CREATE TABLE reservas (id INTEGER PRIMARY KEY, fecha TEXT, hora TEXT, id_usuario INTEGER, id_cancha INTEGER, id_estado INTEGER NULL, FOREIGN KEY(id_usuario) REFERENCES usuarios(id), FOREIGN KEY(id_cancha) REFERENCES canchas(id), FOREIGN KEY(id_estado) REFERENCES estados(id))',
  ];

  conexion() async {
    String pathDB = await getDatabasesPath();

    return await openDatabase(p.join(pathDB, 'app_tenis.db'), version: 1,
        onCreate: (Database db, int version) async {
      for (var table in tables) {
        await db.execute(table);
      }
    }, onUpgrade: (Database db, int oldVersion, int version) async {
      if (oldVersion < version) {}
    });
  }


}
