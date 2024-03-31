import 'package:app_tenis/config/db.dart';
import 'package:app_tenis/models/cancha.dart';
import 'package:sqflite/sqflite.dart';

final List<Map<String, Object?>> canchas = [
  {
    'nombre': "Los naranjos",
    'direccion': "direcion",
    'descripcion': "Bello ambiente y siempre soleado",
    'imagen': "assets/cancha_A.jpg",
    'precio': "130.00",
    'lat': "10.4358606",
    'long': "-66.8601004",
    'iluminacion': 'Baja',
    'superficie': 'cemento'
  },
  {
    'nombre': "La trinidad",
    'precio': "220.00",
    'direccion': "direcion",
    'descripcion': "Hermosas canchas rodeadas de naturaleza",
    'imagen': "assets/cancha_B.jpg",
    'lat': "10.4364287",
    'long': "-66.8798947",
    'iluminacion': 'Alta',
    'superficie': 'cemento'
  },
  {
    'nombre': "Campo alegre",
    'precio': "180.00",
    'direccion': "direcion",
    'descripcion': "Canchas con vista a un hermoso bosque",
    'imagen': "assets/cancha_C.jpg",
    'lat': "10.4823986",
    'long': "-66.8695142",
    "iluminacion": "Alta",
    "superficie": "cemento"
  }
];

void callCanchasSeeder() async {
  Database db = await DB().conexion();
  List validate = await db.query("canchas");
  if (validate.length <= 0) {
    for (Map<String, Object?> cancha in canchas) {
      await db.insert("canchas", cancha);
    }
  }
  db.close();
}
