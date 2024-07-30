import 'package:flutter/material.dart';

class HeaderSIW extends StatelessWidget {
  const HeaderSIW({super.key, required this.titulo});

  final String titulo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: deprecated_member_use
    final TextStyle bodyMedium = Theme.of(context).textTheme.bodyMedium!;
    final decoration1 = BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        blurRadius: 4,
        offset: const Offset(
          0,
          4,
        ),
      )
    ]);
    final decoration2 = BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(15),
    );
    return Container(
        margin: const EdgeInsets.only(bottom: 6),
        height: size.height * 0.15,
        width: size.width,
        decoration: decoration1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: (size.height * 0.13) * 0.65,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                titulo,
                maxLines: 2,
                style: bodyMedium,
              ),
            ),
            Container(
                // color: Colors.black,
                padding: const EdgeInsets.only(left: 10, bottom: 3),
                alignment: Alignment.topLeft,
                width: size.width,
                child: Column(
                  children: [
                    Text('Informacion', style: bodyMedium),
                    Container(
                      decoration: decoration2,
                      height: 3,
                      width: size.width * 0.4,
                    )
                  ],
                ))
          ],
        ));
  }
}
