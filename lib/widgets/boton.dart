import 'package:flutter/material.dart';

class Boton extends StatelessWidget {
  final Function onTap;
  final String texto;
  final Color textColor;

  final Color color;

  const Boton({Key? key, required this.onTap, required this.texto, this.color =Colors.white, this.textColor = Colors.black}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const  EdgeInsets.symmetric( vertical: 10.00),
      child: MaterialButton(
        padding: const  EdgeInsets.all(18.00),
        minWidth: double.infinity,
        color: color,
        onPressed: onTap as void Function()?,
        child: Text(
          texto.toUpperCase(),
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
