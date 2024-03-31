import 'package:app_tenis/blocs/canchas_bloc/canchas_bloc.dart';
import 'package:app_tenis/models/cancha.dart';
import 'package:app_tenis/pages/canchas_page/widgets/cancha_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CanchasPage extends StatelessWidget {
  CanchasPage({Key? key}) : super(key: key);

  final List<Cancha> canchas = [
    Cancha(
      id: 1,
      nombre: "Los naranjos",
      direccion: "direcion",
      descripcion: "Bello ambiente y siempre soleado",
      imagen: "assets/cancha_A.jpg",
      lat: "10",
      precio: 50.00,
      long: "10",
    ),
    Cancha(
      id: 2,
      nombre: "Prados del este",
      precio: 350.00,
      direccion: "direcion",
      descripcion: "Hermosas canchas rodeadas de naturaleza",
      imagen: "assets/cancha_B.jpg",
      lat: "20",
      long: "20",
    ),
    Cancha(
      id: 3,
      nombre: "El bosque",
      precio: 180.00,
      direccion: "direcion",
      descripcion: "Canchas con vista a un hermoso bosque",
      imagen: "assets/cancha_C.jpg",
      lat: "30",
      long: "30",
    )
  ];

  @override
  Widget build(BuildContext context) {
    _init(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          // color: Colors.green,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF4f643c),
              Colors.white,
            ],
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Seleccione la cancha',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24.00,
                      fontFamily: "Poppins",
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 40,
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      color: Colors.white,
                      
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CanchaItem(
                    cancha: canchas[0],
                    size: size,
                  ),
                  CanchaItem(
                    cancha: canchas[1],
                    size: size,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: CanchaItem(
                  cancha: canchas[2],
                  size: size,
                ),
              )
            ]),
      ),
    );
  }
   void _init(context){
    BlocProvider.of<CanchasBloc>(context).add(Init());
    
  }

}
