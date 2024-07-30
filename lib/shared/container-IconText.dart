import 'package:flutter/material.dart';

class ContainerIconText extends StatelessWidget {
  const ContainerIconText({
    super.key,
    required this.icon,
    required this.widthGeneral,
    required this.heightGeneral,
    required this.widthIcon,
    required this.widthText,
    required this.iconSize,
    required this.textoFunction,
    this.onTap,
  });

  final IconData icon;
  final int iconSize;
  //Contenedor Base
  final double heightGeneral;
  final double widthGeneral;
  //Dimenciones Contenedor Icono
  final double widthIcon;
  //Dimenciones Contenedor Texto
  final double widthText;
  // Widget Texto
  final Widget textoFunction;
  //Presionar Boton
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const shadow = [
      Shadow(
        // Sombra inferior derecha
        offset: Offset(0.7, 0.7),
        color: Color(0xFF00A541),
      ),
      Shadow(
        // Sombra inferior izquierda
        offset: Offset(-0.7, 0.7),
        color: Color(0xFF00A541),
      ),
      Shadow(
        // Sombra superior derecha
        offset: Offset(0.7, -0.7),
        color: Color(0xFF00A541),
      ),
      Shadow(
        // Sombra superior izquierda
        offset: Offset(-0.7, -0.7),
        color: Color(0xFF00A541),
      ),
    ];

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: heightGeneral,
        width: widthGeneral,
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: widthIcon,
              child: Icon(
                icon,
                shadows: shadow,
                size: iconSize.toDouble(),
                color: Colors.black,
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 5),
                alignment: AlignmentDirectional.centerStart,
                width: widthText,
                child: textoFunction),
          ],
        ),
      ),
    );
  }
}
