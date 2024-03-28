import 'dart:math';
import 'package:app_tenis/models/reserva.dart';
import 'package:faker/faker.dart';

final List<Reserva> reservas = [
    Reserva(
      fecha: faker.date.dateTime().toString(),
      hora: faker.date.time().toString(),
      idUsuario: 1,
      idCancha: 3,
    ),
    Reserva(
      fecha: faker.date.dateTime().toString(),
      hora: faker.date.time().toString(),
      idUsuario: 3,
      idCancha: 2,
    ),
    Reserva(
      fecha: faker.date.dateTime().toString(),
      hora: faker.date.time().toString(),
      idUsuario: 2,
      idCancha: 2,
    ),
    Reserva(
      fecha: faker.date.dateTime().toString(),
      hora: faker.date.time().toString(),
      idUsuario: 1,
      idCancha: 1,
    ),

];


void callReservasSeeder() async {
  for (Reserva reserva in reservas) {
    print('Creando reserva...');
    print("idusuario: ${reserva.idUsuario} idcancha: ${reserva.idCancha} fecha: ${reserva.fecha} hora: ${reserva.hora}");
    await reserva.create();
  }
}
