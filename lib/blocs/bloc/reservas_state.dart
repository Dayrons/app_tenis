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
}
