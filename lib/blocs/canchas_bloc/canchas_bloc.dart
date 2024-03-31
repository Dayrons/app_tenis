import 'package:app_tenis/models/cancha.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'canchas_event.dart';
part 'canchas_state.dart';

class CanchasBloc extends Bloc<CanchasEvent, CanchasState> {
  CanchasBloc() : super(CanchasInitial()) {
    on<CanchasEvent>((event, emit) async {

      if(event is Init){
        final List canchas = await Cancha().list();

        
        final List<Cancha> cancgasObject =
            List.generate(canchas.length, (index) {
          final cancha = canchas[index];
        return Cancha(
            id: cancha['id'],
            nombre: cancha['nombre'],
            precio: double.parse(cancha['precio']),
            direccion: cancha['direccion'],
            descripcion: cancha['descripcion'],
            imagen: cancha['imagen'],
            lat: cancha['lat'],
            long: cancha['long'],
            iluminacion: cancha['iluminacion'],
            superficie: cancha['superficie'],
          );
          

        });

        for (Cancha cancha in cancgasObject) {
          await cancha.obtenerProbabilidadDeLluvia();
        }


        // emit((event.canchas));
      }

    });
  }
}
