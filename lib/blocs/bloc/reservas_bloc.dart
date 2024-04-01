import 'package:app_tenis/databases/seeders/seeder.dart';
import 'package:app_tenis/models/reserva.dart';
import 'package:app_tenis/models/usuario.dart';
import 'package:bloc/bloc.dart';
import 'package:faker/faker.dart';
import 'package:equatable/equatable.dart';
part 'reservas_event.dart';
part 'reservas_state.dart';

class ReservasBloc extends Bloc<ReservasEvent, ReservasState> {
  ReservasBloc() : super(ReservasInitial()) {
    on<ReservasEvent>((event, emit) async {
      if (event is Init) {
        // callUsuariosSeeder();
        callCanchasSeeder();
        // callReservasSeeder();
        final List<Reserva> reservasObject = await _getReservas();
        

        emit(ReservasInitial(reservas: reservasObject));
      }
      if (event is GuardarReserva) {

        emit(ReservasLoading());
        if (event.email != "" &&
            event.nombre != "" &&
            event.apellido != "" &&
            event.telefono != "") {
          if (event.fecha != "" && event.hora != "") {
            final Map validacion =
                await Reserva().validacionPorDia(event.fecha, event.idCancha!);

            if (validacion["validacion"]) {
              emit(ReservasSuccess());

              final Usuario usuario = Usuario(
                  nombre: event.nombre,
                  apellido: event.apellido,
                  telefono: event.telefono,
                  email: event.email,
                  foto: faker.image.image());

              final idUsuario = await usuario.create();

              final reserva = Reserva(
                fecha: event.fecha,
                hora: event.hora,
                idUsuario: idUsuario,
                idCancha: event.idCancha,
              );
              await reserva.create();

              return;
            } else {
              emit(ReservasError(mensaje: validacion["mensaje"]));
            }
          }
          emit(ReservasError(mensaje: "Por favor selecciona una fecha y hora"));
        }
        emit(ReservasError(mensaje: "Los datos del usuario son requeridos"));
      }

      if (event is EliminarReserva) {
        emit(ReservasLoading());
        final reserva = Reserva();
        await reserva.delete(event.idReserva);
        final List<Reserva> reservasObject = await _getReservas();
        emit(ReservasInitial(reservas: reservasObject));
      }
    });
  }

  Future<List<Reserva>> _getReservas() async{
    final List reservas = await Reserva().list();

        final List<Reserva> reservasObject =
            List.generate(reservas.length, (index) {
          final reserva = reservas[index];
          return Reserva(
            id: reserva['id'],
            fecha: reserva['fecha'],
            hora: reserva['hora'],
            idUsuario: reserva['id_usuario'],
            idCancha: reserva['id_cancha'],
            idEstado: reserva['id_estado'],
          );
        });

        for (Reserva reserva in reservasObject) {
          await reserva.setUsuario();
          await reserva.setCancha();
        }

        return reservasObject;
  }

}
