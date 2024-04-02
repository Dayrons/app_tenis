import 'package:app_tenis/config/db.dart';
import 'package:sqflite/sqflite.dart';

abstract class Model {
  final String tableName = "";

  Future<List> list() async {
    Database db = await DB().conexion();
    return await db.query(tableName);
  }

  Future<int> delete(id) async {
    Database db = await DB().conexion();
    var results = await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return results;
  }

  Future<bool> update() {
    return Future<bool>.value(true);
  }

  Future<int> create() async {
    Database db = await DB().conexion();
    final int data = await db.insert(tableName, toMap());
    return data;
  }

  Future<Map> find(id) async {

    Database db = await DB().conexion();
    var results = await db.query(tableName, where: 'id = ?', whereArgs: [id], limit: 1);
    return results[0];
  }

  Map<String, dynamic> toMap() {
    return {};
  }
}
