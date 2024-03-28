import 'package:app_tenis/models/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Cancha extends Model {

  final String tableName = "canchas";
  
  int? id;
  String? nombre;
  double? precio;
  String? direccion;
  String? descripcion;
  String? imagen;
  String? lat;
  String? long;
  String? iluminacion;
  String? superficie;



  Cancha({
    this.id,
     this.nombre,
     this.precio,
     this.direccion,
     this.descripcion,
     this.imagen,
     this.lat,
     this.long,
    this.iluminacion,
    this.superficie,


  });

  Cancha.fromMap(Map snapshot)
      : id = snapshot['id'],
        nombre = snapshot['nombre'],
        precio = double.parse(snapshot['precio']),
        direccion = snapshot['direccion'],
        descripcion = snapshot['descripcion'],
        imagen = snapshot['imagen'],
        lat = snapshot['lat'],
        long = snapshot['long'];
     
  
  Map<String, dynamic> toMap() {
    return {
      "nombre": nombre,
      "precio": precio,
      "direccion": direccion,
      "descripcion": descripcion,
      "imagen": imagen,
      "superficie": superficie,
      "iluminacion": iluminacion,
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