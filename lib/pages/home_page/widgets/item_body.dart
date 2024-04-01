import 'package:app_tenis/blocs/bloc/reservas_bloc.dart';
import 'package:app_tenis/models/reserva.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ItemBody extends StatelessWidget {
  final Reserva reserva;
  ItemBody({Key? key, required this.reserva}) : super(key: key);
  final faker = Faker();
  @override
  Widget build(BuildContext context) {
    DateTime fecha = DateTime.parse(reserva.fecha!);
    String formateado = DateFormat('yyyy-MM-dd').format(fecha);
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
                        style: const TextStyle(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Text(
                    formateado,
                    style: const TextStyle(
                      fontSize: 12.00,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  Container(
                      child: Text(
                    reserva.hora!,
                    style: const TextStyle(
                      fontSize: 12.00,
                      color: Colors.black54,
                    ),
                  ))
                ],
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                        title: const Icon(
                          Icons.info_outline_rounded,
                          size: 30,
                        ),
                        content:
                            const Text('¿Estas seguro de eliminar la reserva?'),
                        actions: [
                          TextButton(
                            child: Text("Eliminar"),
                            onPressed: () {
                              BlocProvider.of<ReservasBloc>(context)
                                  .add(EliminarReserva(idReserva: reserva.id!));
                            },
                          ),
                          TextButton(
                            child: Text("Cancelar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ]),
                  );
                },
                icon: const Icon(Icons.delete),
                color: Colors.grey[300],
                iconSize: 20,
              )
            ]));
  }

  void _eliminar(BuildContext context, Reserva reserva) {
    BlocProvider.of<ReservasBloc>(context)
        .add(EliminarReserva(idReserva: reserva.id!));
  }
}
