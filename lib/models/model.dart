import 'package:app_tenis/config/db.dart';
import 'package:sqflite/sqflite.dart';

abstract class Model {
  final String tableName = "";

  Future<List> list() async {
    Database db = await DB().conexion();
    return await db.query(tableName);
  }

  Future<bool> delete() {
    return Future<bool>.value(true);
  }

  Future<bool> update() {
    return Future<bool>.value(true);
  }

  Future<int> create() async {
    Database db = await DB().conexion();
    final int data = await db.insert(tableName, toMap());
    print(data);
    await db.close();
    return data;
  }

  Future<Map> find(id) async {
    print("ID user: $id");
    print("Table name: $tableName");
    Database db = await DB().conexion();
    var results = await db.query(tableName, where: 'id = ?', whereArgs: [id], limit: 1);
    await db.close();
    return results[0];
  }

  Map<String, dynamic> toMap() {
    return {};
  }
}
