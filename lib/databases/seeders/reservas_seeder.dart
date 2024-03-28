import 'dart:math';
import 'package:app_tenis/models/reserva.dart';
import 'package:faker/faker.dart';


    final List<Map<String, dynamic>> reservas = [
      {
        'fecha': faker.date.dateTime().toString(),
        'hora': faker.date.time().toString(),
        'idUsuario': 1,
        'idCancha': 3,
      },
      {
        'fecha': faker.date.dateTime().toString(),
        'hora': faker.date.time().toString(),
        'idUsuario': 3,
        'idCancha': 2,
      },
      {
        'fecha': faker.date.dateTime().toString(),
        'hora': faker.date.time().toString(),
        'idUsuario': 2,
        'idCancha': 2,
      },
      {
        'fecha': faker.date.dateTime().toString(),
        'hora': faker.date.time().toString(),
        'idUsuario': 1,
        'idCancha': 1,
      },
    ];




void callReservasSeeder() async {
  
  for (Map reserva in reservas) {
    final reservaObject =Reserva.fromMap(reserva);
    await reservaObject.create();

  
  }
}
