import 'package:app_tenis/models/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Cancha extends Model {

  final String tableName = "canchas";
  
  int id;
  String nombre;
  double precio;
  String direccion;
  String descripcion;
  String imagen;
  String lat;
  String long;



  Cancha({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.direccion,
    required this.descripcion,
    required this.imagen,
    required this.lat,
    required this.long,


  });

  Cancha.fromMap(Map snapshot, String id)
      : id = snapshot['id'],
        nombre = snapshot['nombre'],
        precio = snapshot['precio'],
        direccion = snapshot['direccion'],
        descripcion = snapshot['descripcion'],
        imagen = snapshot['imagen'],
        lat = snapshot['lat'],
        long = snapshot['long'];
     
  
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nombre": nombre,
      "precio": precio,
      "direccion": direccion,
      "descripcion": descripcion,
      "imagen": imagen,
      "lat": lat,
      "long": long,
      
    };
  }

  Future<int> obtenerProbabilidadDeLluvia() async {
  var url = Uri.parse('http://api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={3968c586fc0c853ab92995ab7def51b7}');

  var response = await http.get(url);
  var data = json.decode(response.body);
  int probabilidadDeLluvia = data['list'][0]['rain']['3h'];
  return probabilidadDeLluvia;

  
}




}