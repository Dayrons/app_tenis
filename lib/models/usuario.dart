import 'package:app_tenis/models/model.dart';

class Usuario extends Model{


  final String tableName = "usuarios";

  int? id;
  String? nombre;
  String? foto;
  String? apellido;
  String? email;
  String? telefono;

  Usuario({ this.id,  this.nombre,  this.foto,  this.apellido,  this.email,  this.telefono});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nombre: json['nombre'],
      foto: json['foto'],
      apellido: json['apellido'],
      email: json['email'],
      telefono: json['telefono'],
    );
  }

  Usuario.fromMap(Map snapshot)
      : id = snapshot['id'],
        nombre = snapshot['nombre'],
        apellido = snapshot['apellido'],
        email = snapshot['email'],
        telefono = snapshot['telefono'],
        foto = snapshot['foto'];


  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'foto': foto,
      'apellido': apellido,
      'email': email,
      'telefono': telefono,
    };
  }

  
}