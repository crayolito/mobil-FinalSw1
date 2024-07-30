import 'package:app_sw1final/data/data.dart';
import 'package:flutter/material.dart';

// Butones de Diferentes Enfoques para el Mapa o Centro Comercial
class ButtonsDifApproaches extends StatelessWidget {
  const ButtonsDifApproaches({super.key, required this.listaButtons});

  final List<MapTypeOptions> listaButtons;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height * 0.02),
      width: size.width,
      height: size.height * 0.18,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...listaButtons.map((e) => ButtonDifApproach(data: e)).toList() ,
          ],
        ),
      ),
    );
  }
}

// Buton para cambiar el enfoque del mapa(DISEÑO BUTON)
class ButtonDifApproach extends StatelessWidget {
  const ButtonDifApproach({super.key, required this.data});

  final MapTypeOptions data;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: deprecated_member_use
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    // ignore: deprecated_member_use
    final displayMedium = Theme.of(context).textTheme.displayMedium;

    final decoration1 = BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      border: Border.all(
          color: data.bandera ? const Color(0xFF00A541) : Colors.white,
          width: 3.5),
    );
    final decoration2 = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image:
            DecorationImage(image: AssetImage(data.imagen), fit: BoxFit.cover));
    final padding1 = EdgeInsets.symmetric(
      vertical: size.height * 0.003,
      horizontal: size.width * 0.005,
    );
    final padding2 = EdgeInsets.symmetric(
      vertical: size.height * 0.01,
      horizontal: size.width * 0.01,
    );

    return Container(
      margin: EdgeInsets.only(right: size.width * 0.06),
      width: size.width * 0.27,
      height: size.height * 0.16,
      child: Column(
        children: [
          GestureDetector(
            onTap: data.onTap,
            child: Container(
              padding: padding1,
              decoration: decoration1,
              child: Container(
                padding: padding2,
                height: size.height * 0.11,
                width: size.width * 25,
                decoration: decoration2,
              ),
            ),
          ),
          Text(data.titulo, style: data.bandera ? bodySmall : displayMedium)
        ],
      ),
    );
  }
}
