import 'package:app_tenis/models/reserva.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class ItemBody extends StatelessWidget {
  final Reserva reserva;
  ItemBody({Key? key, required this.reserva}) : super(key: key);
  final faker = Faker();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10, bottom: 20),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        // height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(reserva.usuario!.foto!),
                            fit: BoxFit.cover)),
                  ),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reserva.usuario!.nombre!,
                        style: const  TextStyle(
                          fontSize: 16.00,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        reserva.cancha!.nombre!,
                        style: const TextStyle(
                          fontSize: 14.00,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                  child: Text(
                reserva.fecha!,
                style:const  TextStyle(
                  fontSize: 16.00,
                  fontWeight: FontWeight.bold,
                ),
              ))
            ]));
  }
}
