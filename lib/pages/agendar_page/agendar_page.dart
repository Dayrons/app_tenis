import 'package:app_tenis/pages/home_page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
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
        body: BlocListener<ReservasBloc, ReservasState>(
            listener: (context, state) {
              if (state is ReservasError) {
                final snackBar = SnackBar(
                  content: Center(
                    child: Text(state.mensaje),
                  ),
                  backgroundColor: const Color(0XFFff5e57).withOpacity(0.8),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              if (state is ReservasSuccess) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              }
            },
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(infoReserva.cancha!.imagen!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                        vertical: size.height * 0.05),
                    width: size.width * 0.9,
                    height: size.height * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Input(
                                      input: 'nombre',
                                      texto: "Nombre",
                                      width: width * 0.42,
                                      validacion: true,
                                      obscureText: false,
                                      controller: nombreController,
                                    ),
                                    Input(
                                      input: 'apellido',
                                      texto: "Apellido",
                                      validacion: true,
                                      width: width * 0.42,
                                      obscureText: false,
                                      controller: apellidoController,
                                    ),
                                  ]),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Input(
                                      input: 'telefono',
                                      texto: "Telefono",
                                      width: width * 0.42,
                                      validacion: true,
                                      obscureText: false,
                                      controller: telefonoController,
                                    ),
                                    Input(
                                      input: 'email',
                                      texto: "Email",
                                      validacion: true,
                                      width: width * 0.42,
                                      obscureText: false,
                                      controller: emailController,
                                    ),
                                  ]),
                              ElevatedButton(
                                child: Text('Seleccionar fecha y hora'),
                                onPressed: () => _selectDate(context),
                              )
                            ],
                          ),
                          BlocBuilder<ReservasBloc, ReservasState>(
                            builder: (context, state) {
                              if (state is ReservasLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Boton(
                                onTap: () {
                                  guardarReserva(context,
                                      infoReserva: infoReserva);
                                },
                                texto: "Reservar",
                                color: Colors.green,
                                textColor: Colors.white,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )));
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
        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

        context.read<InfoReservacionCubit>().setFecha(formattedDate);
        context
            .read<InfoReservacionCubit>()
            .setHora("${pickedTime.hour}:${pickedTime.minute}");
      }
    }
  }

  void guardarReserva(context, {required Reserva infoReserva}) {
    BlocProvider.of<ReservasBloc>(context).add(GuardarReserva(
      nombre: nombreController.text,
      apellido: apellidoController.text,
      telefono: telefonoController.text,
      email: emailController.text,
      fecha: infoReserva.fecha!,
      hora: infoReserva.hora!,
      idCancha: infoReserva.cancha!.id!,
    ));
    FocusScope.of(context).unfocus();
  }
}
