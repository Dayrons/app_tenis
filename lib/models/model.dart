import 'package:app_tenis/config/db.dart';
import 'package:sqflite/sqflite.dart';

class Model {
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
  
  Future<Map<dynamic, dynamic>> create() {
    return Future<Map<dynamic, dynamic>>.value({});
  }

 
}
