part of 'reservas_bloc.dart';

sealed class ReservasEvent extends Equatable {
  const ReservasEvent();

  @override
  List<Object> get props => [];
}

class Init extends ReservasEvent {
  const Init();

  @override
  List<Object> get props => [];
}

class GuardarReserva extends ReservasEvent {
  final String nombre;
  final String apellido;
  final String telefono;
  final String email;
  final String fecha;
  final String hora;
  final int? idCancha;
  const GuardarReserva({
     this.nombre = "",
     this.apellido ="",
     this.telefono  = "",
     this.email= "",
     this.fecha = "",
     this.hora = "",
     this.idCancha,
  });

  @override
  List<Object> get props => [];
}


class EliminarReserva extends ReservasEvent {
  final int idReserva;
  const EliminarReserva({required this.idReserva});

  @override
  List<Object> get props => [idReserva];
}

