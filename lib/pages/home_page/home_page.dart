import 'package:app_tenis/pages/home_page/widgets/body_home.dart';
import 'package:app_tenis/pages/home_page/widgets/header_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

   @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return 
    Scaffold(
      body: Stack(
        children: [
          HeaderHome(size: size),
          BodyHome(size: size)
        ],
      ),
    );
  }
}