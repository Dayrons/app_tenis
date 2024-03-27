import 'package:app_tenis/pages/canchas_page/canchas_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/background_3.jpg",
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "TenisApp",
                style: TextStyle(
                  fontSize: 30.00,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: (size.width * 80) / 100,
                child: const Text(
                  "Agendamiento de canchas de tenis",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.00,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10.00,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => CanchasPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Agendar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
