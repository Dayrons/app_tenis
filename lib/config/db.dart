import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DB {
  List tables = [
    'CREATE TABLE usuarios (id INTEGER PRIMARY KEY, nombre TEXT, apellido TEXT, email TEXT, telefono TEXT)',

    'CREATE TABLE estados (id INTEGER PRIMARY KEY, nombre TEXT)',

    'CREATE TABLE canchas (id INTEGER PRIMARY KEY, nombre TEXT, direccion TEXT, descripcion TEXT, imagen TEXT, latitud TEXT, longitud TEXT)',


    'CREATE TABLE reserva (id INTEGER PRIMARY KEY, fecha D, hora TEXT, idUsuario TEXT, idCancha TEXT, idEstado TEXT, FOREIGN KEY(idUsuario) REFERENCES usuario(id), FOREIGN KEY(idCancha) REFERENCES cancha(id), FOREIGN KEY(idEstado) REFERENCES estado(id))',

    'CREATE TABLE horario (id INTEGER PRIMARY KEY, horaInicio TEXT, horaFin TEXT)',
  ];

  conexion() async {
    String pathDB = await getDatabasesPath();


    return await openDatabase(p.join(pathDB, 'app_tenis.db'), version: 1,
        onCreate: (Database db, int version) async {
      for (var table in tables) {
        await db.execute(table);
      }
    }, onUpgrade: (Database db, int oldVersion, int version) async {
      
      if (oldVersion < version) {
        

      }
    });
  }
}