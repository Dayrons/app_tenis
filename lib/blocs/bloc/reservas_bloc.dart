import 'package:app_tenis/databases/seeders/seeder.dart';
import 'package:app_tenis/models/reserva.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'reservas_event.dart';
part 'reservas_state.dart';

class ReservasBloc extends Bloc<ReservasEvent, ReservasState> {

  

  ReservasBloc() : super(ReservasInitial()) {
    on<ReservasEvent>((event, emit) async {
      if (event is Init) {
        // callUsuariosSeeder();
        // callCanchasSeeder();
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

        emit(ReservasInitial(reservas: reservasObject));
      }
    });
  }
}
