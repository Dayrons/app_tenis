import 'package:app_tenis/models/cancha.dart';
import 'package:app_tenis/models/reserva.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'info_reservacion_state.dart';

class InfoReservacionCubit extends Cubit<Reserva> {
  InfoReservacionCubit()
      : super(Reserva(
          id: 0,
          idCancha: 0,
          fecha: "",
          hora: "",
          idUsuario: 0,
          idEstado: 0,
        ));

  void setCancha(Cancha cancha) => emit(state.copyWith(cancha: cancha));

  void setFecha(String fecha) => emit(state.copyWith(fecha: fecha));

  void setHora(String hora) => emit(state.copyWith(hora: hora));
    
}
