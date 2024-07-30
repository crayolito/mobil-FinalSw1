import 'package:flutter/material.dart';

// TODO: BUTTON PERSONALIZADO CON ICONO Y TEXTO
class ButtonPIconText extends StatelessWidget {
  const ButtonPIconText({super.key, this.onTap, required this.icon});

  final GestureTapCallback? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoration = BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 7,
          spreadRadius: 0.5,
          offset: Offset(0, 3),
        ),
      ],
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: size.height * 0.02,
          vertical: size.height * 0.01,
        ),
        width: size.width * 0.13,
        height: size.height * 0.06,
        decoration: decoration,
        child: Icon(
          icon,
          size: size.width * 0.08,
          color: const Color(0xFF16DB65),
        ),
      ),
    );
  }
}

