// El fondo sera la cancha seleccionada en la pantalla anterior conn el nombre de la cancha como titulo
// el boton de regresa sera el icono de flecha hacia atras encerrado en un circulo
// el formulario tendra el efecto cristalino
import 'dart:developer';

import 'package:app_tenis/blocs/bloc/reservas_bloc.dart';
import 'package:app_tenis/blocs/cubit/info_reservacion_cubit.dart';
import 'package:app_tenis/models/reserva.dart';
import 'package:app_tenis/widgets/boton.dart';
import 'package:app_tenis/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgendarPage extends StatelessWidget {
  AgendarPage({super.key});
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Reserva infoReserva = context.watch<InfoReservacionCubit>().state;
   
    final double width = size.width * 0.8;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(infoReserva.cancha!.imagen!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: width,
            height: size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        const Text(
                          "Informacion de reserva",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 24.00,
                            fontFamily: "Poppins",
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10.00,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Input(
                                input: 'nombre',
                                texto: "Nombre",
                                width: width * 0.36,
                                validacion: true,
                                obscureText: false,
                                controller: nombreController,
                                onChange: () {},
                              ),
                              Input(
                                input: 'apellido',
                                texto: "Apellido",
                                validacion: true,
                                width: width * 0.36,
                                obscureText: false,
                                controller: apellidoController,
                                onChange: () {},
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Input(
                                input: 'telefono',
                                texto: "Telefono",
                                width: width * 0.36,
                                validacion: true,
                                obscureText: false,
                                controller: telefonoController,
                                onChange: () {},
                              ),
                              Input(
                                input: 'email',
                                texto: "Email",
                                validacion: true,
                                width: width * 0.36,
                                obscureText: false,
                                controller: emailController,
                                onChange: () {},
                              ),
                            ]),
                        ElevatedButton(
                          child: Text('Seleccionar fecha y hora'),
                          onPressed: () => _selectDate(context),
                        )
                      ],
                    ),
                    Boton(
                      onTap: () {
                        guardarReserva(context,infoReserva: infoReserva);  
                      },
                      texto: "Reservar",
                      color: Colors.green,
                      textColor: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime pickedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        context.read<InfoReservacionCubit>().setFecha(pickedDate.toString());
        context.read<InfoReservacionCubit>().setHora(pickedTime.toString());
        
      }
    }
  }

  void guardarReserva(context,{required Reserva infoReserva}) {
    BlocProvider.of<ReservasBloc>(context).add(GuardarReserva(
      nombre: nombreController.text,
      apellido: apellidoController.text,
      telefono: telefonoController.text,
      email: emailController.text,
      fecha: infoReserva.fecha!,
      hora: infoReserva.hora!,
      idCancha: infoReserva.cancha!.id!,
      
    ));
   
  }
}
