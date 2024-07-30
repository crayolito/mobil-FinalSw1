import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.titulo,
  });

  final String titulo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextStyle bodyLarge = Theme.of(context).textTheme.bodyLarge!;

    int i = titulo.indexOf(' ', titulo.indexOf(' ') + 1);
    String tituloNew = "";
    if (i != -1) {
      tituloNew = titulo.replaceRange(
          i, i + 1, '\n'); // Reemplaza el segundo espacio con '\n'
    } else {
      tituloNew = titulo;
    }

    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.01),
      alignment: Alignment.center,
      width: size.width,
      height: size.height * 0.115,
      child: Text(tituloNew, textAlign: TextAlign.center, style: bodyLarge),
    );
  }
}
