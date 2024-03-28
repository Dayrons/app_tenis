import 'package:app_tenis/blocs/bloc/reservas_bloc.dart';
import 'package:app_tenis/pages/home_page/widgets/item_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    _init(context);
    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width,
        height: (size.height * 80) / 100,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: BlocBuilder<ReservasBloc, ReservasState>(
            builder: (context, state) {
              if (state is ReservasInitial) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.reservas.length,
                  itemBuilder: (context, index) {
                    print(state.reservas[index].usuario!.nombre);
                    return ItemBody(
                      reserva: state.reservas[index],
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
  void _init(context){
    BlocProvider.of<ReservasBloc>(context).add(Init());
    
  }

}
