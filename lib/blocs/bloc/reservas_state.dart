part of 'reservas_bloc.dart';

sealed class ReservasState extends Equatable {
  const ReservasState();
  
  @override
  List<Object> get props => [];
}

final class ReservasInitial extends ReservasState {
  final List<Reserva> reservas;

  const ReservasInitial({
    this.reservas = const [],
  });
  
  @override
  List<Object> get props => [reservas];
}

final class ReservasError extends ReservasState {
  final String mensaje;

  const ReservasError({
    required this.mensaje,
  });
}

final class ReservasLoading extends ReservasState {
  const ReservasLoading();
}

final class ReservasSuccess extends ReservasState {
  


}