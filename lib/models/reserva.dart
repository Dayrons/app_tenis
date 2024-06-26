import 'package:app_tenis/config/db.dart';
import 'package:app_tenis/models/cancha.dart';
import 'package:app_tenis/models/model.dart';
import 'package:app_tenis/models/usuario.dart';
import 'package:sqflite/sqflite.dart';

class Reserva extends Model {
  final String tableName = "reservas";

  int? id;
  String? fecha;
  String? hora;
  int? idUsuario;
  int? idCancha;
  int? idEstado;
  Cancha? cancha;
  Usuario? usuario;

  Reserva(
      {this.id,
      this.fecha,
      this.hora,
      this.idUsuario,
      this.idCancha,
      this.idEstado,
      this.cancha,
      this.usuario});

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fecha': fecha,
      'hora': hora,
      'id_usuario': idUsuario,
      'id_cancha': idCancha,
      'id_estado': idEstado,
    };
  }

  Future setUsuario() async {
    final Map usuario = await Usuario().find(idUsuario!);
    this.usuario = Usuario.fromMap(usuario);
  }

  Future setCancha() async {
    final Map cancha = await Cancha().find(idCancha!);
    this.cancha = Cancha.fromMap(cancha);
  }

  Reserva.fromMap(Map snapshot)
      : id = snapshot['id'],
        fecha = snapshot['fecha'],
        hora = snapshot['hora'],
        idUsuario = snapshot['id_usuario'],
        idCancha = snapshot['id_cancha'];

  Future<Map> validacionPorDia(String fecha, int idCancha) async {
    final Database db = await DB().conexion();

    List reservas = await db.query(tableName,
        where: 'fecha = ? AND id_cancha = ?', whereArgs: [fecha, idCancha]);

    if (reservas.length < 3) {
      return {'mensaje': 'Reserva exitosa', 'validacion': true};
    }

    for (var reserva in reservas) {
      if (reserva['hora'] == hora) {
        return {'mensaje': 'La hora indicada ya fue seleccionada', 'validacion': false};
      }
    }
    return {'mensaje': 'Ya no se pueder reservar por el dia de hoy', 'validacion': false};
  }
}
