import 'package:app_tenis/config/db.dart';
import 'package:app_tenis/models/cancha.dart';
import 'package:sqflite/sqflite.dart';


    final List<Map<String, Object?>> canchas = [
      {
        'nombre': "Los naranjos",
        'direccion': "direcion",
        'descripcion': "Bello ambiente y siempre soleado",
        'imagen': "assets/cancha_A.jpg",
        'lat': "10",
        'precio': "50.00",
        'long': "10",
      },
      {
        'nombre': "Prados del este",
        'precio': "350.00",
        'direccion': "direcion",
        'descripcion': "Hermosas canchas rodeadas de naturaleza",
        'imagen': "assets/cancha_B.jpg",
        'lat': "20",
        'long': "20",
      },
      {
        'nombre': "El bosque",
        'precio': "180.00",
        'direccion': "direcion",
        'descripcion': "Canchas con vista a un hermoso bosque",
        'imagen': "assets/cancha_C.jpg",
        'lat': "30",
        'long': "30",
      }
    ];


void callCanchasSeeder() async {
     Database db = await DB().conexion();
  for (Map<String,Object?> cancha in canchas) {
    final int data = await db.insert("canchas", cancha);
    print(data);
    // return data;
   
  }
    db.close();
}