import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reservas_event.dart';
part 'reservas_state.dart';

class ReservasBloc extends Bloc<ReservasEvent, ReservasState> {
  ReservasBloc() : super(ReservasInitial()) {
    on<ReservasEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
