// El fondo sera la cancha seleccionada en la pantalla anterior conn el nombre de la cancha como titulo
// el boton de regresa sera el icono de flecha hacia atras encerrado en un circulo
// el formulario tendra el efecto cristalino
import 'package:app_tenis/blocs/cubit/info_reservacion_cubit.dart';
import 'package:app_tenis/models/reserva.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgendarPage extends StatelessWidget {
  const AgendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Reserva infoReserva = context.watch<InfoReservacionCubit>().state;
    print(size.width * 0.5);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(infoReserva.cancha!.imagen),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: size.width * 0.8,
            height: size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    ));
  }
}
