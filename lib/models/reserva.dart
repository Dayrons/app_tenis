import 'package:app_tenis/models/cancha.dart';
import 'package:app_tenis/models/model.dart';

class Reserva extends Model{

  final String tableName = "reservas";
  
  int id;
  String fecha;
  String hora;
  int idUsuario;
  int idCancha;
  int idEstado;
  Cancha? cancha;

  Reserva({required this.id, required this.fecha, required this.hora, required this.idUsuario, required this.idCancha,  required this.idEstado, this.cancha});

  factory Reserva.fromJson(Map<String, dynamic> json) {
    return Reserva(
      id: json['id'],
      fecha: json['fecha'],
      hora: json['hora'],
      idUsuario: json['id_usuario'],
      idCancha: json['id_cancha'],
      idEstado: json['id_estado'],
    );
  }
  Reserva copyWith({
    int? id,
    String? fecha,
    String? hora,
    int? idUsuario,
    int? idCancha,
    int? idEstado,
    Cancha? cancha,
  }) {
    return Reserva(
      id: id ?? this.id,
      fecha: fecha ?? this.fecha,
      hora: hora ?? this.hora,
      idUsuario: idUsuario ?? this.idUsuario,
      idCancha: idCancha ?? this.idCancha,
      idEstado: idEstado ?? this.idEstado,
      cancha: cancha ?? this.cancha,
    );
  }
  

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fecha': fecha,
      'hora': hora,
      'id_usuario': idUsuario,
      'id_cancha': idCancha,
      'id_estado': idEstado,
    };
  }
}