import 'package:app_tenis/models/model.dart';

class Usuario extends Model{
  int id;
  String nombre;
  String foto;
  String apellido;
  String email;
  String telefono;

  Usuario({required this.id, required this.nombre, required this.foto, required this.apellido, required this.email, required this.telefono});

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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'foto': foto,
      'apellido': apellido,
      'email': email,
      'telefono': telefono,
    };
  }
}