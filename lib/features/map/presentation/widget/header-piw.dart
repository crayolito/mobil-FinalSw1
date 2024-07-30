import 'package:app_sw1final/blocs/infoMarker/info_marker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderPIW extends StatelessWidget {
  const HeaderPIW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);
    final size = MediaQuery.of(context).size;
    const shadows = [
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
    return Container(
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      height: size.height * 0.06,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 0.1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                infoMarkerBloc
                    .add(OnChangeViewInfo(!infoMarkerBloc.state.viewInfo));
              },
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 35,
                shadows: shadows,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 35,
                shadows: shadows,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
