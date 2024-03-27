import 'package:app_tenis/blocs/bloc/reservas_bloc.dart';
import 'package:app_tenis/blocs/cubit/info_reservacion_cubit.dart';
import 'package:app_tenis/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InfoReservacionCubit>(
          create: (context) => InfoReservacionCubit(),
        ),
         BlocProvider<ReservasBloc>(
          create: (context) => ReservasBloc(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App tenis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        
      ),
      home: const HomePage(),
    );
  }
}



