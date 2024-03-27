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

