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
  final int idCancha;
  const GuardarReserva({
    required this.nombre,
    required this.apellido,
    required this.telefono,
    required this.email,
    required this.fecha,
    required this.hora,
    required this.idCancha,
  });

  @override
  List<Object> get props => [];
}

