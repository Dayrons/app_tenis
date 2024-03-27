import 'dart:math';
import 'package:app_tenis/models/reserva.dart';
import 'package:faker/faker.dart';

void callReservasSeeder() async {
  for (int i = 0; i < 10; i++) {
    Reserva reserva = Reserva(
      fecha: faker.date.dateTime().toString(),
      hora: faker.date.time().toString(),
      idUsuario: Random().nextInt(3) + 1,
      idCancha: Random().nextInt(3) + 1,
    );

    await reserva.create();
  }
}
