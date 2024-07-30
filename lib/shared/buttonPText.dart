import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TODO : BOTON PERSONALIZADO CON TEXTO
class ButtonPText extends StatelessWidget {
  const ButtonPText({
    super.key,
    required this.onTap,
  });

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoration = BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 4,
          spreadRadius: 0.5,
          offset: Offset(0, 5),
        ),
      ],
    );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.topCenter,
        width: size.width,
        height: size.height * 0.12,
        child: Container(
          width: size.width * 0.5,
          height: size.height * 0.09,
          decoration: decoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ir Tiendas",
                  style: GoogleFonts.anta(
                    fontSize: size.width * 0.07,
                    color: const Color(0xFF00A541),
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
