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
        

        emit(ReservasInitial(reservas: reservasObject));
      }
      if(event is GuardarReserva){

        final bool validacion  = await Reserva().validacionPorDia(event.fecha);
        if(validacion){
          // emit(ReservasError(message: "No se puede reservar en este día"));

          final Usuario usuario = Usuario(
          nombre: event.nombre,
          apellido: event.apellido,
          telefono: event.telefono,
          email: event.email,
          foto: faker.image.image()
        );

        final idUsuario = await usuario.create();
        print("Usuario guardado con id: $idUsuario");
        final reserva = Reserva(
          fecha: event.fecha,
          hora: event.hora,
          idUsuario: idUsuario,
          idCancha: 1,
        );
        final idReserva = await reserva.create();
        print("Reserva guardada con id: $idReserva");
          return;
        }
        
        
      }
    });
  }
}
