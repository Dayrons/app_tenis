import 'package:app_tenis/models/cancha.dart';


    final List<Map<String, dynamic>> canchas = [
      {
        'nombre': "Los naranjos",
        'direccion': "direcion",
        'descripcion': "Bello ambiente y siempre soleado",
        'imagen': "assets/cancha_A.jpg",
        'lat': "10",
        'precio': 50.00,
        'long': "10",
      },
      {
        'nombre': "Prados del este",
        'precio': 350.00,
        'direccion': "direcion",
        'descripcion': "Hermosas canchas rodeadas de naturaleza",
        'imagen': "assets/cancha_B.jpg",
        'lat': "20",
        'long': "20",
      },
      {
        'nombre': "El bosque",
        'precio': 180.00,
        'direccion': "direcion",
        'descripcion': "Canchas con vista a un hermoso bosque",
        'imagen': "assets/cancha_C.jpg",
        'lat': "30",
        'long': "30",
      }
    ];


void callCanchasSeeder() async {
  for (Map cancha in canchas) {
    final canchaObject =Cancha.fromMap(cancha);
    await canchaObject.create();
   
  }
}