import 'package:app_tenis/blocs/cubit/info_reservacion_cubit.dart';
import 'package:app_tenis/models/cancha.dart';
import 'package:app_tenis/pages/agendar_page/agendar_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CanchaItem extends StatelessWidget {
  final Size? size;
  final Cancha cancha;
  const CanchaItem({super.key, this.size, required this.cancha});

  @override
  Widget build(BuildContext context) {
    final height = size!.height * 0.4;
    return InkWell(
      onTap: () {
        context.read<InfoReservacionCubit>().setCancha(cancha);
        Navigator.push( context, CupertinoPageRoute(builder: (context) => AgendarPage())); 
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: size!.width * 0.35,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              cancha.imagen!,
            ),
          ),
        ),
        child: Container(
         
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Clima: 25°',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          cancha.nombre!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text('Precio: \$${cancha.precio}',
                            style: const TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                            )),
                      ]),
                ),
                Container(
                    width: double.infinity,
                    height: height * 0.4,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.cloudy_snowing,
                              color: Colors.blueAccent,
                            ),
                            Text(
                              'Probabilidad : 0%',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    )),
              ]),
        ),
      ),
    );
  }
}
