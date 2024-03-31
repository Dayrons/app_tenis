part of 'canchas_bloc.dart';

sealed class CanchasState extends Equatable {
  const CanchasState();
  
  @override
  List<Object> get props => [];
}

final class CanchasInitial extends CanchasState {}


final class CanchasLoading extends CanchasState {}

final class CanchasLoaded extends CanchasState {
  final List<Cancha> canchas;

  const CanchasLoaded(this.canchas);

  @override
  List<Object> get props => [canchas];
}
